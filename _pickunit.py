import json
from collections import Counter
p = r'D:\CodexData\Temp\attest-worktree\build\task_queue.json'
d = json.loads(open(p, encoding='utf-8').read())
print('TOP', type(d).__name__, list(d)[:10] if isinstance(d, dict) else len(d))
if isinstance(d, dict):
    for k, v in d.items():
        print(k, type(v).__name__, len(v) if hasattr(v, '__len__') else '')
    tasks = None
    for k in ('tasks', 'queue', 'units'):
        if isinstance(d.get(k), list):
            tasks = d[k]; break
else:
    tasks = d
if tasks:
    print('TASKS', len(tasks))
    print('STATUS', Counter(t.get('status') for t in tasks).most_common())
    print('SAMPLE NOT_STARTED')
    n = 0
    for t in tasks:
        if t.get('status') == 'NOT_STARTED':
            print(json.dumps(t, ensure_ascii=False)[:900])
            n += 1
            if n >= 3:
                break
