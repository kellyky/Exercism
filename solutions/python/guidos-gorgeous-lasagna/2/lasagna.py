"""Functions used in preparing Guido's gorgeous lasagna.
"""

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME_PER_LAYER = 2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time in minutes.

    :param number_of_layers: int - number of lasagna layers.
    :return: int - 2 minutes preparation time per layer.

    Function that takes the number of layers of lasagna as an argument and 
    returns total preparation time in minutes, based on 2 minutes per layer.
    """

    return number_of_layers * PREPARATION_TIME_PER_LAYER


def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the bake time elapsed.

    :param number_or_layers: int - number of lasagna layers.
    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - number of minutes lasagna has been baking in overn.

    Function that takes number of layers and elapsed bake time and returns total
    number of minutes spent cooking. 
    """

    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
