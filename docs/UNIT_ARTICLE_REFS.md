# Normative units — 条項参照・序数対・かな範囲・令和年度（2,571 units, PROVED_SCOPE）

Recorded UNRESOLVED by the decomposer (`unhandled_conditions = [fragment]`);
only structural/ordinal claims are proven, so all derive `PROVED_SCOPE`, never
`FULLY_VERIFIED`.

| family | units | structure |
|---|---|---|
| latin_pair | 1,319 | two full-width letters ＡＡ..ＺＺ → ordinal pair (1..26)² |
| article_ref | 1,040 | 第X項/条/号 (X = kanji numeral), 同項, 前項, この項 → reference |
| kana_range | 123 | イ及びロ / イからハまで → Iroha ordinal range |
| reiwa_fiscal | 89 | 令和八年度 / 令和十六年度 → Reiwa fiscal year number |

| id | content |
|---|---|
| H | These fragments resolve to ordinal pairs, article targets, Iroha ranges or Reiwa year numbers; their substantive normative content is absent. |
| T | `lake build JapanTaxLaw.ArticleRefsAndOrdinalPairsTests`; `python scripts/ci/source_audit_artrefs.py` |
| D | Kernel checks of paragraph parsing (第二項, 第十一項), Latin pairs, Iroha ranges and Reiwa fiscal years, plus reference identity; independent spec; all 2,571 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a wrong paragraph ordinal, a reference to a different target, an ordinal outside the Iroha range, and a misread Reiwa year. |
| U | The provisions carrying these references, their substantive conditions/effects and cross-references NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
