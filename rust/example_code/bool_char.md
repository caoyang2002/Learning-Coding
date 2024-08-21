# char

[布尔、字符类型](https://www.hackquest.io/zh/syntax/Rust%20%E5%9F%BA%E7%A1%80%E8%AF%BE%E7%A8%8B/learn/9ad466ae-358f-47f1-befc-db9bce7964a2?menu=learningTrack&learningTrackId=b502eb82-9254-45e7-be22-1f460aafb2cf&menuCourseId=f900092a-e3ac-44fc-9d49-744119511e36&lessonId=9ad466ae-358f-47f1-befc-db9bce7964a2&documentationId=null)

```rust
use std::thread;
use std::time::Duration;

// 这个函数耗时3秒
fn get_calculate_result() -> bool {
		// 模拟复杂计算，耗时3s
		thread::sleep(Duration::from_secs(3));
    println!("called this function");
    false
}

fn main() {
    // 打印各国语言的单个字符
    let thai_char  = 'ก';
    let korean_char = '한';
    let traditional_chinese_char = '繁';
    let indonesian_char = 'ä';
    // 注意，这里str是字符串类型，不是字符，只不过长度为1
    let str = "国";
    println!("thai_char : {}", thai_char );
    println!("Korean: {}", korean_char);
    println!("Traditional Chinese: {}", traditional_chinese_char);
    println!("Indonesian: {}", indonesian_char);

    //测测你和我中间有多少个字符
    for i in '你'..='我' {
        print!("{}", i);//你佡佢佣……戏成我，中间共有4786个字符
    }

    let f: bool = true;
    // 触发短路原则，不会调用get_calculate_result函数进行复杂计算
    // 如果改成 get_calculate_result() | f，则会先调用函数，有性能影响
    if f || get_calculate_result() {
        println!("Success!");
    }
}
```
