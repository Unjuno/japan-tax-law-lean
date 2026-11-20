import JapanTaxLaw.TaxFinance

/-!
# PerCapitaEqualRate — 地方税法 art. 38（個人の均等割の標準税率）

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Snapshot SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53

Normative unit: NORM|9090b882bace49ea0dbb6a5727ff30fdf0fee04c11a037c87261bd947462e9ce
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:38/Article#38/Paragraph#1/ParagraphSentence/Sentence#1
Verbatim (one normative unit, 35 normalized chars):
  「個人の均等割の標準税率は、千円とする。」

Reading (verbatim): 千円 = 1,000 yen per person. Money = Nat, unit = yen,
domain = non-negative integers. `persons` is caller-established.

Scope: the ¥1,000 standard rate and its arithmetic application only.
NOT MODELLED: 条例による税率の変更, 法定税率との差, reduced/exempt classes,
均等割と所得割の合算, assessment procedure, 附則/経過措置.
This is a computable slice of one normative unit, not an article/law completion
claim. No `sorry`, `admit`, `axiom` or `Classical.choice` is used.
-/

namespace JapanTaxLaw.PerCapitaEqualRate

open JapanTaxLaw.TaxFinance

/-- art. 38: the standard per-capita equal-rate amount 「千円」. -/
def standardRate : Money := 1_000

/-- Arithmetic application: `persons` people × the standard rate. -/
def standardCharge (persons : Nat) : Money := persons * standardRate

example : standardRate = 1_000 := by decide
example : standardCharge 0 = 0 := by decide
example : standardCharge 1 = 1_000 := by decide
example : standardCharge 11 = 11_000 := by decide
example : standardCharge 12 = 12_000 := by decide
example : standardCharge 13 = 13_000 := by decide

end JapanTaxLaw.PerCapitaEqualRate
