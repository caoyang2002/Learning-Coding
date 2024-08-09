// use futures::TryStreamExt;
use hyper::service::{make_service_fn, service_fn};
use hyper::{Body, Request, Response, Server};
use std::convert::Infallible;
use std::net::TcpListener;

fn is_port_available(port: u16) -> bool {
    match TcpListener::bind(("127.0.0.1", port)) {
        Ok(listener) => {
            // 如果绑定成功，则立即关闭 listener，并返回 true 表示端口可用
            drop(listener);
            true
        }
        Err(_) => false, // 绑定失败则返回 false 表示端口已被占用
    }
}

fn find_available_port(start_port: u16) -> u16 {
    let mut port = start_port;
    loop {
        if is_port_available(port) {
            return port;
        }
        port += 1;
    }
}

async fn handle_request(req: Request<Body>) -> Result<Response<Body>, Infallible> {
    println!("Received request:");
    println!("Method: {}", req.method());
    println!("Uri: {}", req.uri());

    // 处理请求头
    println!("Headers:");
    for (name, value) in req.headers() {
        println!("  {}: {}", name, value.to_str().unwrap());
    }

    // 读取请求体
    let whole_body = hyper::body::to_bytes(req.into_body()).await.unwrap();
    let body_str = String::from_utf8_lossy(&whole_body);
    println!("Body: {}", body_str);

    // 构建响应
    let response = Response::builder()
        .status(200)
        .header("Content-Type", "text/plain")
        .body(Body::from("Hello, World!"))
        .unwrap();

    Ok(response)
}

#[tokio::main]
async fn main() {
    let initial_port = 8080;
    let available_port = find_available_port(initial_port);

    println!("Available port: {}", available_port);
    let addr = ([127, 0, 0, 1], available_port).into();

    let make_svc =
        make_service_fn(|_conn| async { Ok::<_, Infallible>(service_fn(handle_request)) });

    let server = Server::bind(&addr).serve(make_svc);

    println!("Server running on http://{}", addr);

    if let Err(e) = server.await {
        eprintln!("Server error: {}", e);
    }
}

