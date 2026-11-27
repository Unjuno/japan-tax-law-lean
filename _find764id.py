import json
d = json.loads(open(r'D:\CodexData\Temp\attest-worktree\build\task_queue.json',
                    encoding='utf-8').read())
needle = '特定貨物に課する一般関税及び報復関税については、それぞれ別個の関税として関税法第二章の規定を適用する。'
hits = [t for t in d['tasks'] if needle in t.get('text', '')]
print('HITS', len(hits))
for t in hits:
    for k in ('id','law_id','history_id','article','paragraph','provision',
              'source_path','text','kinds','status'):
        print(k, '=', t.get(k))
    print('---')
