# Adversarial Review — batch 137

## Scope
Mechanically generated review (NOT a human review): every check below was re-run by script against the pinned snapshot and the in-tree detectors; no human judgement is claimed.

### InvestmentIncomeBelowHalf.lean — 租税条約等実施特例法施行令 第六条の九（投資関連所得割合五十分未満）

- 独立再抽出 (independent re-extraction): law id 362CO0000000335, revision 362CO0000000335_20260521_506CO0000000150, source data/raw/362CO0000000335_20260521_506CO0000000150.law.json. Pinned law_title in law_info: 租税条約等実施特例法施行令 (CabinetOrder); the heading retains the assigned unit shorthand.
- SHA-256 re-computed: 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18 — 照合 / FOUND against the pinned raw snapshot (byte-identical).
- Article Num 6_9 (第六条の九): scoped article text located (1453 chars); unit anchor found verbatim in that article.
- Needle (verbatim): 「直前事業年度の総収入金額のうちに当該直前事業年度の投資関連所得（利子所得、配当所得その他の総務省令、財務省令で定める所得をいう。ロにおいて同じ。）に係る収入金額の占める割合が百分の五十に満たないこと。」
- Literals (2, both source-verified): 50 (五十), 100 (百分 denominator); parse_statutory_rate(scoped) = 1/2; source_literals_verified({50,100}) = True.
- STRICT inequality: 満たない = strictly less than 50; p = 50 does NOT qualify (contrast 以下), p = 49 qualifies. This is the complement of the STRICT-ABOVE >50% norm (ShareMajority50), a distinct direction.
- Boundary categories (>=3): zero (0), small_input (1), threshold_below (49), threshold_at (50, 100), threshold_above (51) — 判定 CONFIRMED via generate_verification_evidence.boundary_evidence_categories.
- 独立抽出 of spec: specThreshold=50, specScale=100, specBelow with no implementation identifiers; spec_literals = {50,100}; independent_spec_ok = True.
- Verdict: BY-DESIGN / CONFIRMED — only the explicit numeric ratio condition is modelled; definitions of 投資関連所得, delegated 省令 criteria, 直前事業年度 computation and other paragraphs are out of scope.
- H/T/D/C/U — H（健全性）: needle and SHA independently re-extracted from the pinned snapshot; T（真正性）: kanji 五十/百分 and 満たない confirmed verbatim; D（判別）: strict-below ratio distinct from strict-above majority, caps and rounding; C（網羅）: zero, small_input and all three threshold categories; U（用途）: 投資関連所得割合 → p < 50 predicate only.
- Mechanical-not-human note: produced by scripted re-extraction and detector calls; this is not a human attestation.
