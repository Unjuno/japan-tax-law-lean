import json, re
p = r'D:\CodexData\Temp\attest-worktree\build\task_queue.json'
d = json.loads(open(p, encoding='utf-8').read())
tasks = d['tasks']
out = []
for t in tasks:
    if t.get('status') != 'NOT_STARTED':
        continue
    txt = t.get('text', '')
    kinds = t.get('kinds', [])
    deps = t.get('dependencies', [])
    if '税' not in t.get('law_title', ''):
        continue
    if not any(k in kinds for k in ('EFFECT', 'CONDITION')):
        continue
    if deps and not all(x.get('sufficient') for x in deps):
        continue
    if not (10 <= len(txt) <= 110):
        continue
    if not re.search(r'[0-9０-９一二三四五六七八九十百千万億]', txt):
        continue
    out.append(t)
print('CANDIDATES', len(out))
for t in out[:12]:
    print('---')
    for k in ('law_id','history_id','article','paragraph','item','provision','law_title','kinds','id'):
        print(k, t.get(k))
    print('TEXT', t.get('text'))
    print('DEPS', t.get('dependencies'))
