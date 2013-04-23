fwords = open("jjs.txt", "r")
fpos = open("positive.txt", "w")
fneg = open("negative.txt", "w")
fextrafood = open("extrafood.txt", "w")

for line in fwords:
    if not line:
        continue
    if line[0] == '.':
        fpos.write(line[1:])
    elif line[0] == '!':
        fneg.write(line[1:])
    elif line[0] == '*':
        fextrafood.write(line[1:])

