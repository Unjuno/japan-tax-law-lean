### DisasterExciseTaxCredit.lean

Source: law 322AC0000000175, revision 322AC0000000175_20220101_503AC0000000011, raw snapshot `data/raw/322AC0000000175_20220101_503AC0000000011.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 酒類又は製造たばこ、揮発油、石油ガス、原油、ガス状炭化水素若しくは石炭の製造者（石油ガスについては石油ガスの充てん者とし、原油、ガス状炭化水素又は石炭については原油、ガス状炭化水素又は石炭の採取者とする。以下この条において同じ。）又は販売業者（石油製品の販売業者を含む。以下この条において同じ。）が販売のために所持するこれらの物（石油製品を含む。）で酒税又はたばこ税、揮発油税、地方揮発油税、石油ガス税若しくは石油石炭税を課せられたものが災害により亡失し、滅失し、又はその本来の用途に供することができない状態になつた場合においては、政令で定めるところにより、当該災害により亡失し、滅失し、又はその本来の用途に供することができない状態になつた酒類又は製造たばこ、揮発油、石油ガス、原油、石油製品、ガス状炭化水素若しくは石炭（以下「被災酒類等」と総称する。）について課せられた酒税又はたばこ税、揮発油税、地方揮発油税、石油ガス税若しくは石油石炭税（以下「酒税等」と総称する。）の税額（延滞税、過少申告加算税、無申告加算税及び重加算税の額を除く。）に相当する金額（被災酒類等について当該製造者又は販売業者が保険金、損害賠償金等により損失を補塡されたときは、その補塡された金額に応じ政令で定めるところにより計算した金額を控除した金額）を当該被災酒類等に係る酒税等の納税義務者がその災害のあつた日以後において納付すべき酒税等の税額から、それぞれ控除する。

H/T/D/C/U: H（税額控除と納付税額への適用を二段で別記録、加算税除外を明記）
T（0・小入力・上限 0 の saturation を kernel-decided examples で検査）
D（原文の「課せられた税額...控除した金額」を独立照合し、政令の補塡計算は
対象外と明示）C（impl は min と条件付き減算、spec は非正ガード付き減算で
独立定式化）U（政令計算・他税目・納税義務者認定・手続・加算税は NOT MODELLED。
有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled ceiling agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
