### TaxableQuantityResidual.lean

Source: law 328AC0000000006, revision 328AC0000000006_20260525_506AC0000000052, raw snapshot `data/raw/328AC0000000006_20260525_506AC0000000052.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 第一号に規定する課税標準たる数量からそれぞれ当該税率の適用区分ごとに前号に規定する課税標準たる数量を控除した数量（以下この項において「課税標準数量」という。）

H/T/D/C/U: H（第一号数量・前号数量・控除後数量を別記録）T（0・小入力・
上限 0 の saturation を kernel-decided examples で検査）D（原文の
「数量から...数量を控除した数量」を独立照合し、各号の数量算定・
適用区分認定は対象外と明示）C（impl は min と条件付き減算、spec は
非正ガード付き減算で独立定式化）U（第一号・前号の数量算定、税率区分認定、
端数処理は NOT MODELLED。有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled subtraction agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
