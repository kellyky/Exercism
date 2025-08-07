pub fn is_leap_year(year: u64) -> bool {
    let div_by_four = if year % 4 == 0 { true } else { false };
    let div_by_hundred = if year % 100 == 0 { true } else { false };
    let div_by_four_hundred = if year % 400 == 0 { true } else { false };

    div_by_four && !div_by_hundred || div_by_four_hundred
}


