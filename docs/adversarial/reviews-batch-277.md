# Adversarial review — batch 277

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 相続税法 / 地方税法 snapshots.
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** (and item where applicable) of the named
`source_path` — never accepted as a number found merely somewhere in the whole
law text. The queue records were filtered with ONE mmap pass over
`build/task_queue.json` (candidates cached under gitignored
`build/batch277_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one
kanji numeral >= 2 (never statutory literal 1). Existing `JapanTaxLaw/*.lean`,
the transcription checks, `data/TRANSCRIPTION_CHECK_REGISTRY.json` and the
durable transcription pins were searched first; none of these five units was
previously modelled. Each candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` and `tq.build_tasks` for each law, and
confirming verifiable kind, empty `unhandled_conditions`, no UNRESOLVED unit,
`clause_correspondence` True with basis `spec numerals / rate ratio in clause`,
unit text inside `scoped_article_text(law, article, needles)`, coverage exact +
unique ids, a source path, and verbatim law/revision/needle presence in the
SHA-256-pinned article + paragraph of the raw JSON. No numeral-only match or
UNRESOLVED unit was accepted. 「以上」/「以下」/「以内」 are INCLUSIVE;
「を超え」 is STRICT. No statutory literal 1 is used as a threshold value. The
single-literal `百分のN` ceiling is used only where N/100 is exactly the clause
rate. All boundary examples are kernel-decided (`by unfold …; decide`, plus
`inScopeBool N = bool := by decide`), not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### InheritanceTax42PaymentDecisionWithin3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第四十二条 (Num 42), paragraph 2 (本則),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:42/Article#42/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|1877a47fe13dbd516d2b9a79b33317b2fdb6306e8af3c1dfcb0f8bce730f0c76` (kind REFERENCE).
- Needle 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について前条の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出期限の翌日から起算して三月以内に当該申請に係る税額の全部又は一部について物納財産ごとに当該申請に係る物納の許可をし、又は当該申請の却下をする。」;
  三月以内 is INCLUSIVE (`≤`), so 3 is inside and 4 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 2 = true`, `inScopeBool 3 = true (limit, inclusive)`, `inScopeBool 4 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 3` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四十二条(2)の申請書の提出期限の翌日から起算して三月以内に物納の許可又は却下をしなければならないという参照上の期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2193 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（前条の該当性調査自体・物納財産ごとの許可/却下の実体的要件・他の項・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### InheritanceTax46ApprovalWithin3Months.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000073` (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
  raw snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
  SHA-256 pin `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`,
  article 第四十六条 (Num 46), paragraph 3 (本則),
  `LawBody[3]/MainProvision/MainProvision[5]/Article:46/Article#46/Paragraph#3/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|3882f054e06b85388ee2f5aa85dd1f1b8c5af70afcf8cecbd6a196bf1e25e937` (kind REFERENCE).
- Needle 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について第一項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出があつた日の翌日から起算して三月以内に当該申請の承認をし、又は当該申請の却下をする。」;
  三月以内 is INCLUSIVE (`≤`), so 3 is inside and 4 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 2 = true`, `inScopeBool 3 = true (limit, inclusive)`, `inScopeBool 4 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 3` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四十六条(3)の申請書を受け取つた日の翌日から起算して三月以内に承認又は却下をしなければならないという参照上の期限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2193 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第一項の該当性調査自体・承認/却下の実体的要件・他の項・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax8DecisionWithin60Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第八条 (Num 8), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[0]/Article:8/Article#8/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|8c22b360d1401604dcf17859a3d1b5c7f920fd4b1b7d9985cf7bba52bc338b8f` (kind CONDITION).
- Needle 「総務大臣又は道府県知事は、前項の決定を求める旨の申出を受けた場合においては、その申出を受けた日から六十日以内に決定をし、遅滞なく、その旨を関係地方団体の長に通知しなければならない。」;
  六十日以内 is INCLUSIVE (`≤`), so 60 is inside and 61 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 59 = true`, `inScopeBool 60 = true (limit, inclusive)`, `inScopeBool 61 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 60` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第八条(2)の申出を受けた日から六十日以内に決定をし遅滞なく通知しなければならないという期限条件）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2193 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（第一項の決定自体・通知の方法・関係地方団体の範囲・他の項・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax37_2ReturnCostCeiling30Percent.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三十七条の二 (Num 37_2), paragraph 2, item 3 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:37_2/Article#37_2/Paragraph#2/Item#3/ItemSentence/Sentence#1`.
- Normative unit `NORM|03ccd17a087b0dc7b18206a731228b6db6ffb63635dc8fb45858399354ae329d` (kind DELEGATION).
- Needle 「都道府県等が個別の第一号寄附金の受領に伴い提供する返礼品等の調達に要する費用の額として総務大臣が定めるところにより算定した額が、いずれも当該都道府県等が受領する当該第一号寄附金の額の百分の三十に相当する金額以下であること。」;
  百分の三十以下 is INCLUSIVE (`≤`); 百分の三十 = 30/100 = 0.3, exactly the clause rate, so 30 is inside and 31 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph + item of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true`, `inScopeBool 1 = true`, `inScopeBool 29 = true`, `inScopeBool 30 = true (limit, inclusive)`, `inScopeBool 31 = false` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `percent ≤ 30` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三十七条の二(2)3の返礼品等の調達費が寄附金の額の百分の三十以下であるという委任的割合上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2193 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（総務大臣が定める算定方法自体・第一号寄附金の範囲・他の号・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。


### LocalTax62PenaltyOver10M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第六十二条 (Num 62), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:62/Article#62/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|541f5f9997463cb9ed97a64cc9c6d548c15933a1ddd36407cda351116626f30d` (kind EXCEPTION).
- Needle 「前項の免れた税額が千万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、千万円を超える額でその免れた税額に相当する額以下の額とすることができる。」;
  千万円を超える is STRICT (`<`, threshold excluded), so 10000000 itself is outside and 10000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false`, `inScopeBool 1 = false`, `inScopeBool 9999999 = false`, `inScopeBool 10000000 = false (limit, STRICT-excluded)`, `inScopeBool 10000001 = true` — zero, small_input, threshold_below, threshold_at, threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `10000000 < yen` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第六十二条(2)の免れた税額が千万円を超える場合に罰金の額を引き上げることができるという例外条件の下限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2193 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（同項の罰金の上限・情状による減額・前項の罰金自体・他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2190 unique imports; `lake build` completed
  successfully (2193 jobs).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 685/685 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
