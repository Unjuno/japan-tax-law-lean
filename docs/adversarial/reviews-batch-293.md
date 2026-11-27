# Adversarial review — batch 293

Mechanical (not human) independent re-extraction of five dependency-free,
single-threshold normative units from the pinned 地方税法 snapshot (all five
surviving units are from law 325AC0000000226; 相続税法 candidates were rejected
because their only kanji numeral was a section/item reference or a statutory
literal 1, i.e. a numeral-only match).
No human legal approval is recorded here; every unit remains
`LEGAL_REVIEW_PENDING`.

The needles below were re-extracted independently from the primary sources
(一次資料) and matched verbatim against the pinned raw e-Gov JSON, scoped to the
cited article **and paragraph** of the named `source_path` — never accepted as
a number found merely somewhere in the whole law text. The queue records were
filtered with ONE mmap pass over `build/task_queue.json` (candidates cached under
gitignored `build/batch293_candidates.json`): law id in {325AC0000000073,
325AC0000000226}, status `NOT_STARTED`, no dependencies, verifiable kind, empty
`unhandled_conditions`, exact coverage + unique ids, a source path, short
scoped text, a threshold marker (以上 / 以下 / 超え / 以内) and exactly one
kanji numeral >= 2 (never statutory literal 1, never a 百分/千分 rate clause).
Existing `JapanTaxLaw/*.lean`, the transcription checks,
`data/TRANSCRIPTION_CHECK_REGISTRY.json` and the durable transcription pins
were searched first; none of these five units was previously modelled. Each
candidate was then pre-validated by importing
`scripts/ci/generate_verification_evidence.py` (module import only, `main()`
NOT run), using `checks_by_module()` and `tq.build_tasks` for each law, and
confirming verifiable kind, empty `unhandled_conditions`, no UNRESOLVED unit,
`clause_correspondence` True with basis `spec numerals / rate ratio in clause`,
unit text inside `scoped_article_text(law, article, needles)`, coverage exact +
unique ids, a source path, and verbatim law/revision/needle presence in the
SHA-256-pinned article + paragraph of the raw JSON. The one candidate whose
article lives only in the 附則 (SupplProvision) was REPLACED because the scoped
transcription audit walks MainProvision articles; the replacement unit is in
the 本則 and passes the scoped audit. No numeral-only match or UNRESOLVED unit
was accepted. 「以上」/「以下」/「以内」 are INCLUSIVE; 「を超え」/「をこえる」
are STRICT. No statutory literal 1 is used as a threshold value. The
single-literal `百分のN` ceiling/floor is used only where N/100 is exactly the
clause rate (none of these five units uses one). All boundary examples are
kernel-decided (`by unfold …; decide`, plus `inScopeBool N = bool := by decide`),
not asserted by prose.

**This document was produced mechanically by a script, not by a human reviewer.
It is a transcription/structure check only and is NOT legal approval.**

### LocalTax433ReviewNoticeWithin10Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第四百三十三条 (Num 433), paragraph 12 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:433/Article#433/Paragraph#12/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|0d412a1e79683e6a8ce0e138aab34684494994d54857d8f3c0c6d7eadd6d1c72` (kind REFERENCE).
- Needle 「固定資産評価審査委員会は、第一項の規定による決定をした場合においては、その決定のあつた日から十日以内に、これを審査を申し出た者及び市町村長に文書をもつて通知しなければならない。」;
  十日以内 is INCLUSIVE (`≤`), so 10 is inside and 11 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 9 = true` (threshold_below), `inScopeBool 10 = true` (threshold_at (inclusive)), `inScopeBool 11 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 10` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第四百三十三条(12)の決定のあつた日から十日以内に審査申出者及び市町村長へ文書通知する上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2313 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（決定の内容・通知対象の認定・文書様式・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax700_61HuntingFineCeiling1M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第七百条の六十一 (Num 700_61), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[3]/Article:700_61/Article#700_61/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|759498c6146f076d9cc7d8110eab19a81d286b4ac976cab5b51f63abd7c27a1f` (kind CONDITION).
- Needle 「偽りその他不正の行為により狩猟税の全部又は一部を免れたときは、その違反行為をした者は、百万円以下の罰金に処する。」;
  百万円以下 is INCLUSIVE (`≤`), so 1000000 is inside and 1000001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 999999 = true` (threshold_below), `inScopeBool 1000000 = true` (threshold_at (inclusive)), `inScopeBool 1000001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 1000000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第七百条の六十一(1)の狩猟税の全部又は一部を免れた場合の罰金百万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2313 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（不正行為の認定・情状判断・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax604EvadedAbove1M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第六百四条 (Num 604), paragraph 2 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:604/Article#604/Paragraph#2/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|283a357a88e434d27b4f1cc1cb98c5be5d37476084b74102d7702fda5d65c679` (kind EXCEPTION).
- Needle 「前項の免れた税額が百万円をこえる場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円をこえる額でその免れた税額に相当する額以下の額とすることができる。」;
  百万円をこえる is STRICT (`<`, threshold excluded), so 1000000 itself is outside and 1000001 is inside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = false` (zero), `inScopeBool 1 = false` (small_input), `inScopeBool 999999 = false` (threshold_below), `inScopeBool 1000000 = false` (threshold_at (STRICT: excluded)), `inScopeBool 1000001 = true` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `1000000 < evaded` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第六百四条(2)の免れた税額が百万円をこえる場合に罰金の額を引き上げることができるという下限（厳格））,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2313 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（情状判断・相当額の算定・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax92DemandWithin20Days.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第九十二条 (Num 92), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[1]/Article:92/Article#92/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|f60eb01c231c6702a10dd9134cbf69fc4462c99ce8ffcf99e16303641903a163` (kind CONDITION).
- Needle 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下ゴルフ場利用税について同じ。）までにゴルフ場利用税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」;
  二十日以内 is INCLUSIVE (`≤`), so 20 is inside and 21 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 19 = true` (threshold_below), `inScopeBool 20 = true` (threshold_at (inclusive)), `inScopeBool 21 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `days ≤ 20` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第九十二条(1)のゴルフ場利用税について納期限後二十日以内に督促状を発しなければならないという上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2313 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（完納認定・更正決定時の納期限・督促状の内容・発付手続・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

### LocalTax328_8SeparationFineCeiling100k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。
Mechanical (script-generated), not human; transcription/structure check only, NOT legal approval.

- law `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
  raw snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
  SHA-256 pin `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
  article 第三百二十八条の八 (Num 328_8), paragraph 1 (本則),
  `LawBody[2]/MainProvision/MainProvision[2]/Article:328_8/Article#328_8/Paragraph#1/ParagraphSentence/Sentence#1`.
- Normative unit `NORM|19d6869ad5c8922d23d284bb9abec07606a5132e82123a2d9af1b5fe7d2a4181` (kind CONDITION).
- Needle 「市町村は、分離課税に係る所得割の納税義務者が退職所得申告書を正当な理由がなくて提出しなかつた場合には、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」;
  十万円以下 is INCLUSIVE (`≤`), so 100000 is inside and 100001 is outside.
  The needle is verbatim and unique in the pinned article + paragraph of the
  raw snapshot (one scoped hit). Scope verification was scoped to the article
  + paragraph of the source path, not to the whole law text.
- Boundaries: `inScopeBool 0 = true` (zero), `inScopeBool 1 = true` (small_input), `inScopeBool 99999 = true` (threshold_below), `inScopeBool 100000 = true` (threshold_at (inclusive)), `inScopeBool 100001 = false` (threshold_above) — zero, small_input, threshold_below, threshold_at,
  threshold_above (5 distinct categories, all kernel-decided).
- Independent spec states the bound as `fine ≤ 100000` from statutory literals only
  (no impl identifier); universal axiom-free bridge (`agree_scope`) by `rfl`.
  Statutory literals live only in `def specInScope` before the first `theorem ` marker.
- H/T/D/C/U: H（第三百二十八条の八(1)の退職所得申告書を提出しなかつた場合の過料十万円以下の上限）,
  T（scoped needle 照合 + transcription yield + kernel 境界5区分 + lake build 2313 jobs）,
  D（BY-DESIGN / CONFIRMED — mechanical only）,
  C（正当な理由の認定・条例の内容・他項他条項は非介入）,
  U（人間の法的レビューなし、条項の法的評価・他条項は未判定）。

## Mechanical summary

- Five new dependency-free `NOT_STARTED` normative units; no evidence,
  attestation or task-state file was written by this review.
- `generate_umbrella.py` wrote 2310 unique imports (umbrella --check OK,
  duplicates=0); `lake build` completed successfully (2313 jobs, exit 0).
- One transcription yield per module (ascii article labels in the yield names)
  and five registry entries; `transcription_audit.py` exit 0, 725/725 checks.
- Generated ledgers refreshed: `docs/LAW_STATUS.md`, `docs/COVERAGE.md`,
  `docs/L7_LEDGER.md`.
