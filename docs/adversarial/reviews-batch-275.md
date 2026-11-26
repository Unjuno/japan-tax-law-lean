# Adversarial review — batch 275

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 相続税法 / 地方税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` (never accepted as a
number found merely somewhere in the whole law text). The queue records were
filtered with one mmap pass over `build/task_queue.json` (mmap, single read,
candidates cached under gitignored `build/batch275_candidates.json`): law id in
{325AC0000000073, 325AC0000000226}, status `NOT_STARTED`, no dependencies,
short scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one
kanji numeral >= 2 (never 一). Existing `JapanTaxLaw/*.lean`, the transcription
checks and `data/TRANSCRIPTION_CHECK_REGISTRY.json` were searched first; none
of these five units was previously modelled (the 自動車税 二十日 clause, the
第三百二十一条の十五 三十日 clause and the 第六十八条 千万円 escalation are each
explicitly recorded as NOT MODELLED by adjacent existing modules). Each
candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` and `tq.build_tasks` for the law, and
confirming verifiable kind, empty `unhandled_conditions`, no unresolved
dependency, `clause_correspondence` True with basis `spec numerals / rate ratio
in clause`, unit text inside `scoped_article_text(law, article, needles)`,
coverage exact + unique ids, a source path, and verbatim needle presence in the
scoped article + paragraph of the pinned raw JSON (SHA-256 pinned). No
UNRESOLVED unit and no unit whose only numeral match lies in an unrelated
clause was accepted. 「以上」/「以下」/「以内」 are INCLUSIVE; 「を超え」 is
STRICT. No statutory literal 1 is used as a threshold value. All boundary
examples are kernel-decided (`by unfold …; decide`, plus `inScopeBool N = bool
:= by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax49DisclosureWithin2Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第四十九条 (Num 49), paragraph 3 (本則, `MainProvision[6]`),
  `LawBody[3]/MainProvision/MainProvision[6]/Article:49/Article#49/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|78cc8ff175ad3daa18249df1c3405aa12bf358b03cd2e01bbb63c54515f70843` (kind CONDITION).
- Needle 「第一項の請求があつた場合には、税務署長は、当該請求をした者に対し、当該請求後二月以内に同項の開示をしなければならない。」;
  二月 = 2 months, 「以内」 is INCLUSIVE (`≤`), so 2 months is inside and 3 months is outside.
  The needle is unique in the pinned snapshot (one scoped article hit, one paragraph hit), so the 第四十九条(3) anchor is unambiguous. Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `2 = true` (limit, inclusive),
  `3 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories; `small_input`/`threshold_below` coincide at input 1 because the threshold is 2; all kernel-decided).
- Independent spec states the ceiling as `days ≤ 2` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第四十九条(3)の請求後二月以内に同項の開示をしなければならないという期限条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2178 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第一項の請求自体・開示の内容・方法・請求者の範囲・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### InheritanceTax68PenaltyOver10M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第六十八条 (Num 68), paragraph 2 (本則, `MainProvision[7]`),
  `LawBody[3]/MainProvision/MainProvision[7]/Article:68/Article#68/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|eba9f66fb67552c4ceaf56fe04af9a35b3174396499330bd3b9775f587dcaa37` (kind CONDITION).
- Needle 「前項の免れた相続税額又は贈与税額が千万円を超えるときは、情状により、同項の罰金は、千万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」;
  千万 = 10,000,000 yen, 「を超える」 is STRICT (`<`, threshold excluded), so 10,000,001 yen is inside and 10,000,000 yen itself is outside.
  The needle is unique in the pinned snapshot (one scoped article hit, one paragraph hit), so the 第六十八条(2) anchor is unambiguous. The separate 「金額以下」 upper bound in the same sentence is NOT modelled by this unit. Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `1 = false`, `9999999 = false`,
  `10000000 = false` (limit, STRICT-excluded), `10000001 = true` —
  `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the strict lower bound as `10000000 < yen` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第六十八条(2)の免れた税額が千万円を超える場合に罰金を加重する下限条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2178 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（千万円以下の金額・金額以下の上限・情状による軽減判断・第九十四条の並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax166DemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第百六十六条 (Num 166), paragraph 1 (本則, `MainProvision[1]`),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:166/Article#166/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|96f5bbdae1475e92ed620ff4b6bc654cdc9f4eeb053208e5dd10880a2b0e83bd` (kind CONDITION).
- Needle 「納税者が納期限までに自動車税に係る地方団体の徴収金を完納しない場合には、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十 = 20 days, 「以内」 is INCLUSIVE (`≤`), so 20 days is inside and 21 days is outside.
  The needle is unique in the pinned snapshot (one scoped article hit, one paragraph hit), so the 第百六十六条(1) anchor is unambiguous. The parallel 二十日 clauses for 不動産取得税/軽自動車税/固定資産税 are NOT modelled (the existing LocalTax73_34 module explicitly excludes 自動車税). Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `19 = true`, `20 = true` (limit, inclusive),
  `21 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the ceiling as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第百六十六条(1)の納期限後二十日以内に督促状を発する期間条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2178 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（納期限の定義・完納判定・督促状の記載事項・並行する他税目の二十日条項・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax321_15DecisionWithin30Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十一条の十五 (Num 321_15), paragraph 2 (本則, `MainProvision[2]`),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:321_15/Article#321_15/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|7339f16ada0f4eab605eb9107c87d766ea83d0e1003a1157a9ab6ba5bdf7915d` (kind CONDITION).
- Needle 「道府県知事又は総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」;
  三十 = 30 days, 「以内」 is INCLUSIVE (`≤`), so 30 days is inside and 31 days is outside.
  The needle is unique in the pinned snapshot (one scoped article hit, one paragraph hit), so the 第三百二十一条の十五(2) anchor is unambiguous. The 第五十九条 parallel occurrence is NOT modelled (the existing LocalTax59DecisionWithin30Days module explicitly excludes 第三百二十一条の十五). Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `29 = true`, `30 = true` (limit, inclusive),
  `31 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the ceiling as `days ≤ 30` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第三百二十一条の十五(2)の申出を受けた日から三十日以内に道府県知事又は総務大臣が決定をする期間条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2178 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前項の申出自体・決定の内容・申出者の範囲・第五十九条の並行箇所・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax382RegistryNoticeWithin10Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百八十二条 (Num 382), paragraph 1 (本則, `MainProvision[2]`),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:382/Article#382/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|5caf843beaf39506ec441ad9aac4efc5fefee5659817016975740e4a8dcbd948` (kind DELEGATION).
- Needle 「登記所は、土地又は建物の表示に関する登記をしたときは、十日以内に、その旨その他総務省令で定める事項を当該土地又は家屋の所在地の市町村長に通知しなければならない。」;
  十 = 10 days, 「以内」 is INCLUSIVE (`≤`), so 10 days is inside and 11 days is outside.
  The needle is unique in the pinned snapshot (one scoped article hit, one paragraph hit), so the 第三百八十二条(1) anchor is unambiguous. Scope verification was scoped to the article + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `1 = true`, `9 = true`, `10 = true` (limit, inclusive),
  `11 = false` — `zero`, `small_input`, `threshold_below`, `threshold_at`,
  `threshold_above` (5 distinct categories, all kernel-decided).
- Independent spec states the ceiling as `days ≤ 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
- H/T/D/C/U: H（第三百八十二条(1)の登記をした日から十日以内に登記所が市町村長へ通知する委任的期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2178 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（登記の種別・総務省令で定める事項・通知先の市町村長の範囲・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。
