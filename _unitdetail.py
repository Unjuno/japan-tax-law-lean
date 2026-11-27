import json, hashlib
from pathlib import Path
d = json.loads(open(r'D:\CodexData\Temp\attest-worktree\build\task_queue.json',
                    encoding='utf-8').read())
uid = 'NORM|30ed71fa6118f5875097cd20a81a022db6c3de058f41c43787932def13cc9ec6'
t = next(x for x in d['tasks'] if x['id'] == uid)
for k in ('law_id','history_id','enforcement_date','provision','provision_no',
          'article','paragraph','item','subitem','source_path','text','kinds',
          'unhandled_conditions','id','law_title','revision','source_file'):
    print(k, '=', t.get(k))
p = Path(r'D:\CodexData\Temp\attest-worktree') / t['source_file']
print('SOURCE_FILE_EXISTS', p.exists())
if p.exists():
    raw = p.read_bytes()
    print('SHA256', hashlib.sha256(raw).hexdigest(), 'BYTES', len(raw))
    txt = raw.decode('utf-8', errors='replace')
    needle = t['text']
    print('NEEDLE_IN_RAW', needle in txt)
    i = txt.find(needle)
    print('CONTEXT', txt[max(0,i-160):i+len(needle)+80] if i >= 0 else '')
