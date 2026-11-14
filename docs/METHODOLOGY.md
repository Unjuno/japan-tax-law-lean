# Formalization and verification methodology / 形式化・検証方法

## 1. Source provenance

| Item | Current proof of concept |
|---|---|
| Law | 所得税法（昭和40年法律第33号） |
| Law ID | 340AC0000000033 |
| Clauses modeled | 第2条第1項第3号（居住者）、同第5号（非居住者） |
| Primary source | https://laws.e-gov.go.jp/law/340AC0000000033/ |
| Administrative explanations | https://www.nta.go.jp/taxes/shiraberu/taxanswer/gensen/2875.htm |
| Explanations' stated time point | 令和8年（2026年）4月1日現在法令等 |
| Research snapshot date | 2026-11-15 (JST) |
| Important qualifications | 施行日・改正履歴を固定した法令バージョンとの逐条照合、法的レビューは未実施 |
| Status | **PoC; no finding of legal error** |

When a future issue identifies a specific defect, it **must** cite a time-pinned source text and effective date. A general e-Gov law URL is insufficient as the sole historical version record.

## 2. Formalization boundary

The Article 2(1)(iii) predicate is represented as a disjunction of two
**already assessed** legal facts:

- `hasDomesticDomicile`: whether the person has a legally determined domicile in Japan.
- `hasContinuousDomesticAbodeAtLeastOneYear`: whether the person has legally
  established continuous abode in Japan for one year or more.

Article 2(1)(v) is represented as Boolean negation of the Article 2(1)(iii) result.

The following are **not** represented:
- The fact-finding and legal interpretation of domicile or abode.
- Date arithmetic or the legal counting of a one-year period (in particular, **one year is not assumed equal to 365 days**).
- Deemed domicile and exclusions under Article 3.
- Cabinet orders, basic circulars, tax treaties, court judgments, or tax liability under Articles 5/7.
- Non-permanent residence under Article 2(1)(iv).

**Crucial caveat**: Formal consistency of a definition does not imply
completeness or consistency of the statute as a whole.

## 3. Variables and types

All currently used input/output variables are dimensionless, SI unit `1`.

| Symbol in Lean | Meaning | SI unit | Definition | Domain / premise | Type |
|---|---|---|---|---|---|
| `f` | 個人についての、判定済み事実の組 | 1 | `ResidencyFacts` | Legal facts supplied externally | Structure of two `Bool`s |
| `f.hasDomesticDomicile` | 国内住所の法的判定結果 | 1 | Input predicate | `false` or `true`; not calculated here | `Bool` |
| `f.hasContinuousDomesticAbodeAtLeastOneYear` | 国内に引き続き1年以上居所を有することの法的判定結果 | 1 | Input predicate | `false` or `true`; duration law not formalized | `Bool` |
| `resident f` | 限定的モデルの居住者分類 | 1 | Boolean OR of the preceding fields | `false` or `true` | `Bool` |
| `nonResident f` | 限定的モデルの非居住者分類 | 1 | Boolean NOT of `resident f` | `false` or `true` | `Bool` |

**Dimensional check**: All inputs and outputs are `Bool`, so OR/NOT operate
on dimensionless propositions. There is no arithmetic expression of time
in this model; there is thus no hidden conversion from a statutory year
to seconds or days.

## 4. Proof obligations, tests and evidence

A candidate change should include:
1. Law ID, section, paragraph, item, effective date, and the exact official source link.
2. Its translation to a typed Lean expression; explicit implicit assumptions.
3. Positive and negative examples, boundary conditions and applicable exceptions.
4. Mechanical proof or reproducible counterexample plus `lake build`.
5. A second-person review of the law-to-model correspondence.

The initial model proves:
- Equivalence between resident classification and the OR of the two inputs.
- Exhaustiveness of resident / nonresident.
- Exclusivity of resident / nonresident.
- Sufficient conditions for residence.

It tests all four combinations of the two predicates.

## 5. Classify findings conservatively

| Category | What it means | Reporting status |
|---|---|---|
| Modeling bug | Incorrect Lean encoding, missing exception or invalid assumptions | Fix code; **not** a defect in the statute |
| Source/version mismatch | Wrong effective date, transcription, translation or amended text | Fix source/version; **not** yet a defect in the statute |
| Formal inconsistency | A contradiction under recorded axioms and a particular encoded scope | Candidate for independent review |
| Textual ambiguity / editorial issue | Conflicting wording, references or unhandled boundary conditions in authentic text | Candidate for legal review, not proven by Lean alone |
| Confirmed legal issue | Reproducible textual evidence, alternate interpretations resolved, independently reviewed | Document the grounds and scope carefully |

No real-world drafting error, tax loophole, or tax-saving result has been demonstrated by this repository at initialization.

## 6. Suggested next scope

After review of Article 2, model **Article 3's deemed-domicile rule and exclusions** separately, with statute-scoped effects. Then expand to Article 2(1)(iv) non-permanent residence, relevant implementing orders and taxable-income scope. This expansion can reveal missing cases in the model and potential textual questions, but does not predetermine the existence of statutory defects.
