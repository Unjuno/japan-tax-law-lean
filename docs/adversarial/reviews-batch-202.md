# Adversarial review — batch 202

Mechanical (not human) re-extraction and cross-check of
ReconstructionEqualLevySurcharge500 against the pinned source. Reproducible
from committed bytes; NOT a human legal review. No approval field recorded;
legal review stays LEGAL_REVIEW_PENDING.

### ReconstructionEqualLevySurcharge500.lean — 東日本大震災復興臨時特例法 第二条 第一項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 東日本大震災…地方税の臨時特例に関する法律 (law 423AC0000000118),
  revision 423AC0000000118_20111202_000000000000000.
- Source: data/raw/423AC0000000118_20111202_000000000000000.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=2`, `Paragraph#1`,
  `Sentence#1`; scoped article 201 chars. Needle
  「平成二十六年度から平成三十五年度までの各年度分の個人の道府県民税に限り、均等割の標準税率は、地方税法第三十八条の規定にかかわらず、同条に規定する額に五百円を加算した額とする。」
  occurs in the scoped article; sibling article 1 (319 chars) does not.
- 数値: 「五百」 = 500 (`matched_spellings({500}) == {'五百'}`);
  `source_literals_verified` and `clause_correspondence({500}, …)` both True.
  The FY window 二十六/三十五 is recorded as applicability text, not as the
  computation literal; 第三十八条 is a cross-law article identifier.
- cross-law: 「地方税法第三十八条の規定にかかわらず」 is an override of the base
  standard rate. The model adds 500 to a caller-established base and proves
  the reconstructed 1500 yen from `PerCapitaEqualRate.standardRate = 1000`
  (dependency: law 325AC0000000226 / art.38 / enforced 2026-11-01).
- 境界: 499/500/501 and zero are kernel-decided; fixed-yen additive pattern is
  distinguished from a percentage surcharge.
- 独立仕様: specSurcharge/specSpecialRate use their own numerals and no impl
  identifiers; agree* are separate bridges (`rw`/`rfl`).
- 判定 (H/T/D/C/U): H（道府県民税均等割標準税率は38条額+500円）, T（500, 五百,
  bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling negative、
  cross-law base 再構成、spec 独立性）, U（2項市町村民税、base 算定、所得割、
  制限税率、条例変更、端数処理、賦課徴収、他条は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
