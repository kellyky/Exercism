def convert(num):
    raindrops = ''

    if not (num % 3 == 0 or num % 5 == 0 or num % 7 == 0):
        return str(num)

    if num % 3 == 0:
        raindrops += 'Pling'

    if num % 5 == 0:
        raindrops += 'Plang'

    if num % 7 == 0:
        raindrops += 'Plong'

    return raindrops

