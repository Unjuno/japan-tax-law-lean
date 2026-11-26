# Adversarial re-extraction review — batch 257 (mechanical, not human)

Scope: five dependency-free NOT_STARTED normative units of the Local Tax Act
(地方税法), re-extracted independently from the pinned primary snapshot. Every
needle below was checked against the verbatim pinned article text by a
deterministic script; this is a **mechanical** verification, not a human legal
review, and it does not establish legal correctness. BY-DESIGN / CONFIRMED
means the model deliberately covers only the stated threshold, not the whole
article.

H/T/D/C/U is recorded explicitly for each module: H (falsifiable hypothesis),
T (reproduction test), D (disposition), C (competing interpretation), U
(remaining uncertainty). "BY-DESIGN / CONFIRMED" is the disposition of the
mechanical scope check only.

### LocalTax72_48_2TwoPrefecturesCorrection.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Law / revision: 地方税法, law id `325AC0000000226`, revision
  `325AC0000000226_20261101_508AC0000000002`, article 72_48_2
  （第七十二条の四十八の二, 二以上の道府県…課税標準額の総額の更正、決定等）.
- SHA-256 pin: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  = `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Normative unit id: `NORM|4b25d5613cbef9134a7ddd58cf200bdb99e449890a682f2980fd2a916b139c43`.
- Needle (原文逐語): `（二以上の道府県において事務所又は事業所を設けて事業を行う法人の課税標準額の総額の更正、決定等）`.
- Boundary determination: 「二以上」 is an **inclusive floor** (以上): 1 → false,
  2 → true, 3 → true. Verified with kernel-decided `inScope` / `inScopeBool`
  examples (zero / small_input / threshold_below / threshold_at /
  threshold_above).
- H（仮説）: the pinned article caption contains the single kanji numeral 二 with an
  以上 threshold and no other threshold literal.
- T（再現試験）: `scripts/ci/transcription_audit.py` checks the needle verbatim;
  `data/TRANSCRIPTION_CHECK_REGISTRY.json` registers the module; Lean tests
  decide the boundary in the kernel.
- D（判定）: BY-DESIGN / CONFIRMED — needle found; inclusive floor modelled;
  independent spec agrees universally.
- C（競合解釈）: the caption is a heading, not a standalone operative rule; only
  the numerical condition is modelled, never the correction procedure.
- U（残る不確実性）: no human legal review; other clauses of article 72_48_2 are
  out of scope.

This is a mechanical re-extraction and verification record, not a human review.

### LocalTax72_78PrincipalOfficeLocation.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Law / revision: 地方税法, law id `325AC0000000226`, revision
  `325AC0000000226_20261101_508AC0000000002`, article 72_78
  （第七十二条の七十八, 地方消費税の納税義務者等）.
- SHA-256 pin: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  = `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Normative unit id: `NORM|7b5333da217ebf338731a9e2fa42afe9b4eff903fbbbac22c853941b835c693c`.
- Needle (原文逐語): `その事務所等の所在地（その事務所等が二以上ある場合には、主たるものの所在地）`.
- Boundary determination: 「二以上」 is an **inclusive floor** (以上): 1 → false,
  2 → true, 3 → true, with kernel-decided boundary examples in all five
  categories.
- H（仮説）: the pinned sentence contains one kanji numeral 二 immediately followed
  by 以上 and no competing threshold.
- T（再現試験）: transcription audit needle check plus kernel-decided
  `inScopeBool` boundary equations and the universal agreement theorem.
- D（判定）: BY-DESIGN / CONFIRMED — inclusive floor confirmed against the
  verbatim needle; only the count condition is modelled.
- C（競合解釈）: the surrounding provision governs local consumption tax
  obligors; the "principal office" choice for two or more offices is not
  modelled, only the threshold itself.
- U（残る不確実性）: mechanical evidence only; no human legal determination of
  the principal-office rule.

This is a mechanical re-extraction and verification record, not a human review.

### LocalTax314_6IncomeOver2M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Law / revision: 地方税法, law id `325AC0000000226`, revision
  `325AC0000000226_20261101_508AC0000000002`, article 314_6
  （第三百十四条の六, 調整控除）.
- SHA-256 pin: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  = `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Normative unit id: `NORM|0a5153d8f3a2b910d03a9c070354485c8c976f846a4115b1eda1625191ee3e67`.
- Needle (原文逐語): `当該納税義務者の合計課税所得金額が二百万円を超える場合`.
- Boundary determination: 「二百万円を超える」 is a **strict lower bound**
  (を超え): 1,999,999 → false, 2,000,000 → false, 2,000,001 → true.
- H（仮説）: the verbatim clause carries one kanji numeral 二百万 with を超え and
  no upper bound.
- T（再現試験）: pinned needle audit plus kernel `decide` boundaries at
  L-1 / L / L+1 and a universal axiom-free spec bridge.
- D（判定）: BY-DESIGN / CONFIRMED — strictness confirmed; no ceiling is
  modelled because the clause states none.
- C（競合解釈）: the clause sits in an adjustment-deduction table; the deduction
  formula itself is deliberately out of scope.
- U（残る不確実性）: no human review; rate/amount computations outside this
  clause remain unexamined.

This is a mechanical re-extraction and verification record, not a human review.

### LocalTax24_5IncomeOver1_35M.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Law / revision: 地方税法, law id `325AC0000000226`, revision
  `325AC0000000226_20261101_508AC0000000002`, article 24_5
  （第二十四条の五, 個人の道府県民税の非課税の範囲）.
- SHA-256 pin: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  = `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Normative unit id: `NORM|ac3ff069691e424062010107efcc061dc75233df0113af5e9d7fac76fe9ea587`.
- Needle (原文逐語): `障害者、未成年者、寡婦又はひとり親（これらの者の前年の合計所得金額が百三十五万円を超える場合を除く。）`.
- Boundary determination: 「百三十五万円を超える場合を除く」 is a **strict lower
  bound** on the excepted income: 1,349,999 → false, 1,350,000 → false,
  1,350,001 → true. This is NOT an inclusive ceiling: equality stays in scope.
- H（仮説）: the pinned exception clause contains one kanji numeral 百三十五万
  followed by 円を超える.
- T（再現試験）: verbatim needle audit, kernel-decided boundary examples at
  L-1 / L / L+1, and a universal spec agreement theorem.
- D（判定）: BY-DESIGN / CONFIRMED — strictness and the single numeral were
  re-extracted from the primary snapshot; taxpayer categories are not modelled.
- C（競合解釈）: 「〜を除く」 could be read as the exception applying from the
  threshold itself; the verbatim を超える settles strictness mechanically.
- U（残る不確実性）: the four listed person categories are deliberately
  unmodelled; no human legal judgement of the exemption is claimed.

This is a mechanical re-extraction and verification record, not a human review.

### LocalTax314_2NewAnnuityOver56k.lean

独立再抽出（一次資料）による照合・判定。BY-DESIGN / CONFIRMED。

- Law / revision: 地方税法, law id `325AC0000000226`, revision
  `325AC0000000226_20261101_508AC0000000002`, article 314_2
  （第三百十四条の二, 所得控除）.
- SHA-256 pin: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  = `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Normative unit id: `NORM|1d77267a32be0d8754ec1470cf67604a4a84695345f6957f0286ceac90edf1d4`.
- Needle (原文逐語): `前年中に支払つた新個人年金保険料の金額の合計額が五万六千円を超える場合`.
- Boundary determination: 「五万六千円を超える」 is a **strict lower bound**
  (を超え): 55,999 → false, 56,000 → false, 56,001 → true.
- H（仮説）: the pinned clause has a single kanji numeral 五万六千 immediately
  before 円を超える.
- T（再現試験）: pinned needle audit, kernel boundary `decide` examples, and the
  universal `agree_scope` bridge with an independently written spec.
- D（判定）: BY-DESIGN / CONFIRMED — strict threshold reproduced; the annuity
  deduction computation is intentionally excluded.
- C（競合解釈）: other income-deduction items in article 314_2 have their own
  thresholds; none is modelled here.
- U（残る不確実性）: no human legal review; only the threshold of this item is
  evidenced.

This is a mechanical re-extraction and verification record, not a human review.
