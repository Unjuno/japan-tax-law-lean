import json, sys

def text_of(node):
    if isinstance(node, str): return node
    return "".join(text_of(c) for c in node.get("children", []))

p = r'C:\Users\junny\Desktop\japan-tax-law-lean\data\raw\340CO0000000096_20260522_508CO0000000093.law.json'
data = json.load(open(p, encoding='utf-8'))
found = []
def walk(n, scope):
    if isinstance(n, dict):
        t = n.get('tag')
        if t == 'MainProvision': scope='MAIN'
        elif t == 'SupplProvision': scope = 'SP'
        if t == 'Article' and scope == 'MAIN':
            txt = text_of(n)
            i = 0
            while True:
                j = txt.find('附則', i)
                if j == -1: break
                print('MAIN', n.get('attr', {}).get('Num'), '>>>', repr(txt[j:j+20]))
                i = j + 2
            return
        if scope == 'MAIN':
            for c in n.get('children', []): walk(c, scope)
walk(data['law_full_text'], 'ROOT')
