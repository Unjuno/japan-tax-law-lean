from pathlib import Path
p = Path('_cross.log')
t = p.read_text(encoding='utf-8', errors='replace')
print('LINES', len(t.splitlines()), 'SIZE', len(t))
for l in t.splitlines()[-25:]:
    print(l.encode('ascii','backslashreplace').decode())
