extern crate regex;

use regex::Regex;

pub fn is_valid(code: &str) -> bool {
    println!("original code: {}", code);
    let space_free_code = code.replace(" ", "");
    let non_numeric_character = Regex::new(r"[^\d]").unwrap();

    if non_numeric_character.is_match(&space_free_code) { return false }
    if space_free_code.len() < 2 { return false }

    let mut sum: u32 = 0;
    println!("What we're starting wit: {}", space_free_code);

    for (i, digit) in space_free_code.bytes().enumerate() {
        let digit_value = digit as u32 - '0' as u32;
        sum += get_luhn_digit_value(digit_value, i);
    }

    println!("Final Sum: {}", sum);

    return sum % 10 == 0;
}

fn get_luhn_digit_value(digit_value: u32, index: usize) -> u32 {
    if index % 2 == 0 { return digit_value }

    let doubled_digit = digit_value * 2;
    return if doubled_digit < 10 { doubled_digit } else { doubled_digit - 9 };

}

