import json
from pathlib import Path
R = Path(r'D:\CodexData\Temp\pr764-clean')
inv = json.loads((R/'data/INVENTORY.json').read_text(encoding='utf-8'))
rec = next((l for l in inv['laws'] if l['law_id'] == '424CO0000000016'), None)
print('REC', json.dumps(rec, ensure_ascii=False)[:1200])
needle = '第一条 この政令は、平成二十八年一月一日から施行する。'
if rec:
    cur = rec.get('current_revision', {})
    print('CURRENT', json.dumps(cur, ensure_ascii=False)[:600])
    snap = rec.get('raw_snapshot') or {}
    p = R / snap.get('source_file', '')
    print('SNAP', snap.get('source_file'), p.exists())
    if p.exists():
        txt = p.read_text(encoding='utf-8', errors='replace')
        print('NEEDLE_IN_CURRENT', needle in txt)
        print('NEEDLE_NORM', needle.replace(' ', '') in txt.replace(' ', ''))
    hist = rec.get('revisions', [])
    print('REV_COUNT', len(hist))
    for h in hist[:6]:
        print(' REV', json.dumps(h, ensure_ascii=False)[:300])
