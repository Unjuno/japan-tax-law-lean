### ExcessFinanceGrant75Cap.lean

Source: law 431AC0000000004, revision 431AC0000000004_20260401_508AC0000000002, raw snapshot `data/raw/431AC0000000004_20260401_508AC0000000002.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 財源超過団体における十一月の譲与時期に係る基準各譲与時期特別法人事業譲与税額の百分の七十五に相当する額（当該額に当該財源超過団体に係る五月分財源超過団体譲与制限額及び八月分財源超過団体譲与制限額の合算額を加えた額が財源超過額を超える場合には、当該財源超過額から当該合算額を控除した額とする。）をいう。

H/T/D/C/U: H（百分の七十五と財源超過額上限を別々に記録）T（74/75/76 と
上限到達例を kernel-decided examples で検査）D（原文の「百分の七十五」と
「財源超過額から合算額を控除した額」を独立照合し、各額の算定・団体認定は
対象外と明示）C（impl は条件比較と飽和減算、spec は min と
残額ガードで独立定式化）U（基準額・財源超過額・五月/八月制限額の算定、
団体認定、月次処理は NOT MODELLED。有限 grid の一致は普遍的正しさを
意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled rate/cap agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
