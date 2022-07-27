// Copyright © 2022 Karl Bateman. All Rights Reserved.
#![no_std]
#![no_main]

use core::panic::PanicInfo;
mod vga_buffer;

/// This function is called on panic.
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!("{}", info);
    loop {}
}

/// Entrypoint for linkers and bootloaders.
#[no_mangle]
pub extern "C" fn _start() -> ! {
    use core::fmt::Write;

    println!("rOS v1.0.0");

    loop {}
}
