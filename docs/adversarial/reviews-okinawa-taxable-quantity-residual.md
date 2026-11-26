### OkinawaTaxableQuantityResidual.lean

Source: law 347M50000040042, revision 347M50000040042_20251231_507M60000040072, raw snapshot `data/raw/347M50000040042_20251231_507M60000040072.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 第一号の数量から前号の数量を控除した数量（以下この項において「課税標準数量」という。）

H/T/D/C/U: H（第一号数量・前号数量・控除後数量を別記録）T（0・小入力・
同値・超過の境界を kernel-decided examples で検査）D（原文の
「第一号の数量から前号の数量を控除した数量」を独立照合し、各号の数量算定は
対象外と明示）C（impl は条件比較、spec は非正ガード付き減算で独立定式化）
U（各号数量の算定、対象貨物認定、申告手続は NOT MODELLED。有限 grid の
一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled subtraction agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
