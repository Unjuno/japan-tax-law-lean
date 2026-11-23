# Adversarial Review — batch 131

## Scope
Mechanically generated review (NOT a human review): every check below was re-run by script against the pinned snapshot and the in-tree detectors; no human judgement is claimed.

### CapitalTieredAmount.lean — 資本金区分による三段階額（五百万・千万・二千万円）

- 独立再抽出 (independent re-extraction): law id 503M60000008031, revision 503M60000008031_20240401_506M60000008035, source data/raw/503M60000008031_20240401_506M60000008035.law.json.
- SHA-256 re-computed: d732e70d8f54eb1ce6cee566a563ff85408e79a1d6360f757c4f228fe48c3f41 — 照合 / FOUND against the pinned raw snapshot.
- Article Num 1 (第一条): scoped article text located; unit anchor found verbatim in that article.
- Needle (verbatim): 「五百万円（資本金の額等が五千万円超一億円以下である法人が行うものにあっては千万円とし、資本金の額等が一億円超である法人が行うものにあっては二千万円とする。）」
- Literals (5, all source-verified): 5000000 (五百万), 50000000 (五千万), 100000000 (一億), 10000000 (千万), 20000000 (二千万); parse_statutory_rate = None (amount clause, not a 百分の rate).
- Bracket boundaries / inclusivity: 五千万円超 is STRICTLY above 50,000,000 — exactly 50,000,000 stays in the base tier (5,000,000). 一億円以下 is INCLUSIVE — exactly 100,000,000 stays in the mid tier (10,000,000). Only capital > 100,000,000 enters the high tier (20,000,000).
- Boundary categories (>=3): zero (0), small_input (1), threshold_below (49999999, 99999999), threshold_at (50000000, 100000000), threshold_above (50000001, 100000001) — 判定 CONFIRMED.
- 独立抽出 of spec: specBase=5000000, specMidCap=50000000, specHighCap=100000000, specMidAmt=10000000, specHighAmt=20000000, specRequired with no implementation identifiers; spec_literals contains all 5 literals; source_literals_verified = True; independent_spec_ok = True.
- Verdict: BY-DESIGN / CONFIRMED — only the three-tier capital-to-amount structure is modelled; eligibility conditions, procedures and other paragraphs are out of scope.
- H/T/D/C/U — H（健全性）: needle and SHA independently re-extracted from the pinned snapshot; T（真正性）: kanji numerals 五百万/五千万/一億/千万/二千万 confirmed verbatim; D（判別）: tiered amount structure distinct from single thresholds/caps/ratios/rounding/windows; C（網羅）: zero, small_input and three threshold categories across both bracket boundaries; U（用途）: 資本金の額等 → 要件額 three-tier mapping only.
- Mechanical-not-human note: produced by scripted re-extraction and detector calls; this is not a human attestation.
