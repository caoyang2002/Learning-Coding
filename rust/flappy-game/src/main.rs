// 【使用 Rust 开发一个微型游戏【已完结】-哔哩哔哩】 https://b23.tv/wbkUuFB
use bracket_lib::prelude::*;
// 游戏角色的属性：水平位置，垂直位置，速度
// 模式的模式
enum GameMode {
    Menu,
    Playing,
    End,
}

const SCREEN_WIDTH: i32 = 80; // 游戏窗口的宽
const SCREEN_HEIGHT: i32 = 50; // 游戏窗口的高
const FRAME_DURATION: f32 = 75.0; // 单位时间
struct Player {
    // 世界空间的横坐标
    x: i32,
    y: i32,
    velocity: f32,
}
// 玩家
impl Player {
    fn new(x: i32, y: i32) -> Self {
        Player {
            x: 0,
            y: 0,
            velocity: 0.0,
        }
    }
    fn render(&mut self, ctx: &mut BTerm) {
        ctx.set(0, self.y, YELLOW, BLACK, to_cp437('@'));
    }
    // 重力
    fn gravity_and_move(&mut self) {
        if self.velocity < 2.0 {
            self.velocity += 0.2;
        }
        self.y += self.velocity as i32;
        self.x += 1;
        if self.y < 0 {
            self.y = 0;
        }
    }
    // 往上飞
    fn flap(&mut self) {
        self.velocity += -2.0;
        println!("{}", self.velocity);
    }
}

struct State {
    player: Player,
    frame_time: f32,
    mode: GameMode,
    obstacles: Obstacle,
    score: i32,
}

// 关联函数
impl State {
    // 创建游戏，返回默认的状态
    fn new() -> Self {
        State {
            player: Player::new(5, 25),
            frame_time: 0.0,
            mode: GameMode::Menu,
            obstacles: Obstacle::new(SCREEN_WIDTH, 0),
            score: 0,
        }
    }
    // 开始游戏
    fn play(&mut self, ctx: &mut BTerm) {
        // 清理屏幕
        ctx.cls_bg(NAVY);
        //
        self.frame_time += ctx.frame_time_ms;
        if self.frame_time > FRAME_DURATION {
            self.frame_time = 0.0;
            self.player.gravity_and_move();
        }
        if let Some(VirtualKeyCode::Space) = ctx.key {
            self.player.flap();
        }
        self.player.render(ctx);
        ctx.print(0, 0, "Press SPACE to flap!");
        ctx.print(0, 1, &format!("Score: {}", self.score));
        self.obstacles.render(ctx, self.player.x);
        // 通过了障碍物
        if self.player.x > self.obstacles.x {
            // 分数加一
            self.score += 1;
            // 通道变窄
            self.obstacles = Obstacle::new(self.player.x + SCREEN_WIDTH, self.score);
        }
        // 掉到屏幕外或者撞到障碍物
        if self.player.y > SCREEN_HEIGHT || self.obstacles.hit_obstacle(&self.player) {
            self.mode = GameMode::End;
        }
    }
    // 重置
    fn restart(&mut self) {
        self.player = Player::new(5, 25);
        self.frame_time = 0.0;
        self.mode = GameMode::Playing;
        self.obstacles = Obstacle::new(SCREEN_WIDTH, 0);
        self.score = 0;
    }
    fn main_menu(&mut self, ctx: &mut BTerm) {
        // 游戏的所有状态需要重置
        ctx.cls();
        ctx.print_centered(5, "Welcome to Flappy Dragon!");
        ctx.print_centered(8, "(P) Play Game!");
        ctx.print_centered(9, "(Q) Quit Game!");
        if let Some(key) = ctx.key {
            match key {
                VirtualKeyCode::P => self.restart(),
                VirtualKeyCode::Q => ctx.quitting = true,
                _ => {}
            }
        }
    }
    // 死亡
    fn dead(&mut self, ctx: &mut BTerm) {
        // 游戏的所有状态需要重置
        ctx.cls();
        ctx.print_centered(5, "you are dead!");
        ctx.print_centered(6, &format!("You earned {} points", self.score));
        ctx.print_centered(8, "(P) Play Game!");
        ctx.print_centered(9, "(Q) Quit Game!");
        if let Some(key) = ctx.key {
            match key {
                VirtualKeyCode::P => self.restart(),
                VirtualKeyCode::Q => ctx.quitting = true,
                _ => {}
            }
        }
    }
}

// 执行游戏状态
impl GameState for State {
    fn tick(&mut self, ctx: &mut BTerm) {
        match self.mode {
            GameMode::Menu => self.main_menu(ctx),
            GameMode::End => self.dead(ctx),
            GameMode::Playing => self.play(ctx),
        }
    }
}

// 障碍
struct Obstacle {
    // 世界空间的横坐标
    x: i32,
    gap_y: i32,
    size: i32,
}

impl Obstacle {
    fn new(x: i32, score: i32) -> Self {
        let mut rendom = RandomNumberGenerator::new(); // 伪随机
        Obstacle {
            x,
            gap_y: rendom.range(10, 40),
            size: i32::max(2, 20 - score),
        }
    }
    // 渲染
    fn render(&mut self, ctx: &mut BTerm, player_x: i32) {
        // 屏幕空间的横坐标：世界空间的横坐标 - 屏幕空间的横坐标
        let screen_x = self.x - player_x;
        // 中间洞的大小
        let helf_size = self.size / 2;
        for y in 0..self.gap_y - helf_size {
            ctx.set(screen_x, y, RED, BLACK, to_cp437('|'));
        }
        for y in self.gap_y + helf_size..SCREEN_HEIGHT {
            ctx.set(screen_x, y, RED, BLACK, to_cp437('|'));
        }
    }
    // 玩家撞到障碍物
    fn hit_obstacle(&self, player: &Player) -> bool {
        let half_size = self.size / 2;
        let does_x_match = player.x == self.x;
        let player_above_gap = player.y < self.gap_y - half_size;
        let player_below_gap = player.y > self.gap_y + half_size;
        does_x_match && (player_above_gap || player_below_gap)
    }
}
fn main() -> BError {
    // 游戏终端的实例
    // ？表示构建过程中可能会出错，如果出错就抛出 BError
    let context = BTermBuilder::simple80x50()
        .with_title("Flappy Dragon")
        .build()?;
    main_loop(context, State::new())
}
