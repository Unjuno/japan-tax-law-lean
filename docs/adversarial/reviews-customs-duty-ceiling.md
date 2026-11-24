### CustomsAdditionalDutyCeiling.lean

Source: law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005, raw snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 指定された期間内に輸入される指定された貨物の全部につき、又は当該貨物のうち一定の数量若しくは額を超えるものにつき、別表の税率による関税のほか、当該貨物の課税価格とこれと同種又は類似の貨物の本邦における適正と認められる卸売価格（類似の貨物にあつては、当該貨物の性質及び取引方法の差異による価格の相違を勘案して合理的に必要と認められる調整を加えた価格）との差額から別表の税率による関税の額を控除した額以下の関税を課すること。

H/T/D/C/U: H（差額関税の上限を「課税価格-適正卸売価格-別表関税額」と
三段で別記録）T（0・小入力・下限 0 の saturation を kernel-decided examples で検査）
D（原文の「差額から別表の税率による関税の額を控除した額以下」を独立照合し、
認定・価格調整・税率検索は対象外と明示）C（impl は条件的な飽和減算と <=、
spec は非正ガード付き減算と not (<) で独立定式化）
U（指定期間・指定貨物・同種類似判定・適正価格認定・別表税率・数量/額要件は
NOT MODELLED。有限 grid での一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled ceiling agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
