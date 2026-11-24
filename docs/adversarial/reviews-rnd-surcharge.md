### RndSurchargeRate.lean

Source: law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013, raw snapshot `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the unit text recorded in the queue.

> 当該試験研究費割合から百分の十を控除した割合に二を乗じて計算した割合（当該割合に小数点以下三位未満の端数があるときはこれを切り捨てた割合とし、当該計算した割合が百分の十を超えるときは百分の十とする。）

H/T/D/C/U: H（上限 10% と三位未満切捨てを別々に記録した）T（差分 1000000、
二倍、100 単位切捨て、上限を kernel-decided example で検査）D（原文の
「百分の十」「二」「三位」を独立に照合し、割合の算定自体は対象外と明示）
C（impl は加算・剰余・条件分岐、spec は乗算・除算・min で独立定式化）
U（試験研究費割合の算定、他号・他項、適用年度、認定要件は NOT MODELLED）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled arithmetic slice agrees on the kernel-decided grid. This is a
transcription/scope finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING
であり、本記録は承認や法的正しさの証明ではない。
