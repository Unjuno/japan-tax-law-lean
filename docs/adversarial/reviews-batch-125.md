# Adversarial Review — batch 125

## Scope
Mechanically generated review (NOT a human review): every check below was re-run by script against the pinned snapshot and the in-tree detectors; no human judgement is claimed.

### MergerGrantFiscalWindow.lean — 市町村合併補助金 第八条（昭和47〜52年度の適用期間）

- 独立再抽出 (independent re-extraction): law id 347CO0000000160, revision 347CO0000000160_19750430_350CO0000000141, source data/raw/347CO0000000160_19750430_350CO0000000141.law.json.
- SHA-256 re-computed: 20d1e1b4cf45e93d4f30be1546919ed16c7c3c8bd63d47cf311a08282d4d85be — 照合 / FOUND against the pinned value.
- Article Num 8 (第八条): scoped article text located; unit anchor found verbatim in that article.
- Needle (verbatim, leading fullwidth ３ preserved): 「３国は、昭和四十七年度から昭和五十二年度までの各年度に限り、市町村の合併をしようとする市町村（以下この条において「合併関係市町村」という。）に対し、市町村の合併の実施を促進するため、予算の範囲内で、補助金を交付することができる。」
- Literals: 47 (四十七) and 52 (五十二), both found verbatim in scoped Article 8; parse_statutory_rate = None (this clause is a temporal window, not a 百分の rate).
- Boundary categories (>=3): threshold_below (46), threshold_at (47, 52), threshold_above (53), plus zero (0) and small_input (1) — 判定 CONFIRMED.
- 独立抽出 of spec: specStart = 47, specEnd = 52, specInWindow with no implementation identifiers; spec_literals = {47, 52}; source_literals_verified = True; independent_spec_ok = True.
- Verdict: BY-DESIGN / CONFIRMED — only the inclusive temporal-application window [47,52] is modelled; budget amounts, merger conditions and other paragraphs are out of scope.
- H/T/D/C/U — H（健全性）: needle and SHA independently re-extracted; T（真正性）: fullwidth ３ marker and kanji numerals 四十七/五十二 confirmed; D（判別）: temporal validity norm distinct from thresholds/caps/ratios/rounding; C（網羅）: three threshold categories plus zero/small_input; U（用途）: 昭和47〜52年度 grant-window predicate only.
- Mechanical-not-human note: produced by scripted re-extraction and detector calls; this is not a human attestation.
