def convert(num):
    raindrops = ''

    if num % 3 == 0:
        raindrops += 'Pling'

    if num % 5 == 0:
        raindrops += 'Plang'

    if num % 7 == 0:
        raindrops += 'Plong'

    return raindrops or str(num)

