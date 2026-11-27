import json
from pathlib import Path
p = Path(r'D:\CodexData\Temp\pr764-clean\data\verification_evidence.json')
d = json.loads(p.read_text(encoding='utf-8'))
s = json.dumps(d, ensure_ascii=False)
needle = 'NORM|4c6c0978081c151797ee804ca8f1bc05723f8012e191627bf9f47ad78d4b15ae'
print('FILE_SIZE', p.stat().st_size)
print('NORM_ID_IN_EVIDENCE', needle in s)
print('MODULE_IN_EVIDENCE', 'SeparateTariffApplication' in s)
for k in ('units_total','status_counts','schema','tool'):
    if isinstance(d, dict) and k in d:
        print(k, json.dumps(d[k], ensure_ascii=False)[:400])
