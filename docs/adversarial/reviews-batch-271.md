# Adversarial review — batch 271

Mechanical (not human) independent re-extraction of five dependency-free
single-threshold normative units from the pinned 地方税法 snapshot. No human
legal approval is recorded here; every unit remains `LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item where applicable), never accepted as a
number found merely somewhere in the whole text. The queue records were filtered
with one mmap pass over `build/task_queue.json`: law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one kanji
numeral >= 2 (never 一). Existing `JapanTaxLaw/*.lean`, the transcription checks
and `data/TRANSCRIPTION_CHECK_REGISTRY.json` were searched first; none of these
five units was previously modelled. Each candidate was then pre-validated by
importing `scripts/ci/generate_verification_evidence.py` (without running main),
using `checks_by_module()`, building tasks for the law, and confirming verifiable
kind, empty `unhandled_conditions`, `clause_correspondence` True with basis
`spec numerals / rate ratio in clause`, unit text inside `scoped_article_text`,
coverage exact + unique ids, and a source path. 「以上」/「以下」/「以内」 are
INCLUSIVE; 「を超え」 is STRICT. No statutory literal 1 is used as a threshold
value. All boundary examples are kernel-decided (`by unfold …; decide`), not
asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax37_2DesignationBanWithin3Years.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十七条の二 (Num 37_2), paragraph 6 (本則, `MainProvision[1]`),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:37_2/Article#37_2/Paragraph#6/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|130fb2232792b61035e0b3adfa9038056af22cfe1dec52ed7a13f3b752932bea` (kind CONDITION).
- Needle 「総務大臣は、前項の規定により指定を取り消すときは、指定の取消しを受ける都道府県等について、三年以内の期間を定めて指定を行わない旨の決定をしなければならない。」;
  三 = 3 years, 「以内」 is INCLUSIVE (`≤`), so 3 years is inside
  and 4 years is outside. The same sentence also occurs in 第三百十四条の七(6); this unit is pinned to the 第三十七条の二(6) instance named by source_path, not to that parallel occurrence. Scope verification was scoped to the
  article + paragraph of the source path (one scoped hit), not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `2 = true` (below), `3 = true` (limit, inclusive), `4 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the ceiling as `years ≤ 3` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第三十七条の二(6)の指定を取り消した都道府県等について三年以内の期間を定めて指定を行わない旨の決定をしなければならないという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2148 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前項の指定取消し自体・都道府県等の定義・第三百十四条の七の並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax59DecisionWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第五十九条 (Num 59), paragraph 2 (本則, `MainProvision[1]`),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:59/Article#59/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|c924d502b23ff8fe48a5f1968eb9cc82f94d4300ed5c6cd044b79b3feea2f28b` (kind CONDITION).
- Needle 「総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」;
  三十 = 30 days, 「以内」 is INCLUSIVE (`≤`), so 30 days is inside
  and 31 days is outside. The same sentence also occurs in 第三百二十一条の十五(2); this unit is pinned to the 第五十九条(2) instance named by source_path, not to that parallel occurrence. Scope verification was scoped to the
  article + paragraph of the source path (one scoped hit), not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `29 = true` (below), `30 = true` (limit, inclusive), `31 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the ceiling as `days ≤ 30` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第五十九条(2)の総務大臣が申出を受けた日から三十日以内に決定をしなければならないという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2148 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前項の申出自体・決定の内容・第三百二十一条の十五の並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax72_54DecisionWithin60Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十二条の五十四 (Num 72_54), paragraph 5 (本則, `MainProvision[1]`),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:72_54/Article#72_54/Paragraph#5/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|56f6f8b178b7e92cc5e14f79876ba0076424c156b9d47f2d38fdda76f9ec7cea` (kind REFERENCE).
- Needle 「前項の規定による申出に対する総務大臣の決定は、その申出を受理した日から六十日以内にしなければならない。」;
  六十 = 60 days, 「以内」 is INCLUSIVE (`≤`), so 60 days is inside
  and 61 days is outside. The needle is unique in the pinned snapshot (one article, one string hit), so the 第七十二条の五十四(5) anchor is unambiguous. Scope verification was scoped to the
  article + paragraph of the source path (one scoped hit), not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `59 = true` (below), `60 = true` (limit, inclusive), `61 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the ceiling as `days ≤ 60` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七十二条の五十四(5)の総務大臣が申出を受理した日から六十日以内に決定をしなければならないという参照上の期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2148 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前項の申出自体・決定の内容・第八条の六十日並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax73_34DemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七十三条の三十四 (Num 73_34), paragraph 1 (本則, `MainProvision[1]`),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:73_34/Article#73_34/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|f903790af345c6cb309ed2c57107c3a391e1385987ddfbb6ae13bcdec99d1e94` (kind CONDITION).
- Needle 「納税者が納期限までに不動産取得税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十 = 20 days, 「以内」 is INCLUSIVE (`≤`), so 20 days is inside
  and 21 days is outside. The needle is unique in the pinned snapshot (one article, one string hit), so the 第七十三条の三十四(1) anchor is unambiguous. Scope verification was scoped to the
  article + paragraph of the source path (one scoped hit), not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `19 = true` (below), `20 = true` (limit, inclusive), `21 = false` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the ceiling as `days ≤ 20` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七十三条の三十四(1)の不動産取得税の納期限後二十日以内に督促状を発しなければならないという条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2148 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（納期限の定義・完納判定・督促状の記載事項・自動車税/軽自動車税/固定資産税の二十日並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax701_31Population300kPlus.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.
- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`, raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百一条の三十一 (Num 701_31), paragraph 1 (本則, `MainProvision[3]`),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:701_31/Article#701_31/Paragraph#1/Item#1/Subitem1#3/Subitem1Sentence/Sentence#1`.
- Normative unit `NORM|acdb4e25bdeee7c97f6e0cfaf9ad27c874dd29d631e81b310298b74a52e07611` (kind DELEGATION).
- Needle 「イ及びロに掲げる市以外の市で人口（官報で公示された最近の国勢調査の結果による人口その他これに準ずるものとして政令で定める人口をいう。）三十万以上のもののうち政令で指定するもの」;
  三十万 = 300000 population, 「以上」 is INCLUSIVE (`≥`), so 300,000 is inside
  and 299,999 is outside. The needle is unique in the pinned snapshot (one article, one string hit), so the 第七百一条の三十一(1) anchor is unambiguous. Scope verification was scoped to the
  article + paragraph of the source path (one scoped hit), not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `299999 = false` (below), `300000 = true` (limit, inclusive), `300001 = true` (above) —
  `zero`, `small_input`, `threshold_below`, `threshold_at`, `threshold_above`
  (5 distinct categories).
- Independent spec states the floor as `300000 ≤ population` from statutory literals
  only (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第七百一条の三十一(1)の人口三十万以上の市のうち政令で指定するものという委任的条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2148 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（イ及びロに掲げる市・国勢調査以外の人口・政令指定の手続・他の号及び他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。
