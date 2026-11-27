import json
from pathlib import Path
d = json.loads(Path(r'D:\CodexData\Temp\pr764-clean\data\verification_evidence.json').read_text(encoding='utf-8'))
print('TOP', list(d))
for k, v in d.items():
    if isinstance(v, dict):
        print(k, 'dict', len(v), list(v)[:8])
    elif isinstance(v, list):
        print(k, 'list', len(v), json.dumps(v[:1], ensure_ascii=False)[:500])
    else:
        print(k, repr(v)[:200])
