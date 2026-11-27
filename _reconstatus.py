from pathlib import Path
p = Path(__file__).with_name('_recon764_clean.log')
print('SIZE', p.stat().st_size if p.exists() else 0)
if p.exists():
    t = p.read_text(encoding='utf-8', errors='replace')
    keys = ('START', 'ITER', 'GUARD', 'TA ', 'GATE', 'ALL_GREEN',
            'NOT PUSHED', 'HEAD', 'FAIL', 'all present gates',
            'invariants passed', 'checks passed')
    keep = [l for l in t.splitlines() if l.startswith(keys)]
    print('\n'.join(keep[-120:]))
    print('TAIL', t[-1200:].encode('ascii', 'backslashreplace').decode())
