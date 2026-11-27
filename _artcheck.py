from pathlib import Path
for n in ('build/audit_sweep.json', 'build/cross_law.json'):
    p = Path(n)
    print(n, p.exists(), p.stat().st_size if p.exists() else 0)
for n in ('_sweep.log', '_cross.log'):
    p = Path(n)
    if p.exists():
        t = p.read_text(encoding='utf-8', errors='replace')
        print(n, 'TAIL', t[-400:].encode('ascii','backslashreplace').decode())
