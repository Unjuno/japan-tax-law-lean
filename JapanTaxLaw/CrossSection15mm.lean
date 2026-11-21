import JapanTaxLaw.TaxFinance

/-
# CrossSection15mm — 不当廉売関税政令 第一条（横断面寸法: 一・五ミリメートルを超えるもの）

Pinned source:
  Law id: 504CO0000000372
  Official title: 溶融亜鉛めっき鉄線に対して課する不当廉売関税に関する政令
  Law number: 令和四年政令第三百七十二号 (CabinetOrder, 政令)
  Revision: 504CO0000000372_20221208_000000000000000  (current-enforced;
    source `current_revision_status = CurrentEnforced`, enforcement 2022-12-08)
  Raw snapshot: data/raw/504CO0000000372_20221208_000000000000000.law.json
  sha256: 8a24107aeb9a8ae677da410191e847ff53d533744e39ea187e9e8a7f3bc0041a
    (raw bytes 14675; matches INVENTORY.json `raw_snapshot.source_sha256`)
  Statutory article: 第一条 (art. 1; raw JSON Article attr.Num = "1", caption （課税物件）).
  Source path: law_full_text → MainProvision → Article[Num=1] (scoped Article 1).
  Independent re-extraction: the needle occurs verbatim in scoped Article 1,
    checked from the pinned raw bytes (no doc-comment/impl circularity).

原文逐語（pinned, 一字一句改変なし）:
  「横断面の最大寸法が一・五ミリメートルを超えるもの」

Variable contract:
  `tenths : Nat` = 横断面の最大寸法 (maximum cross-section dimension),
    unit 1/10 mm (tenths of a millimetre), domain Nat.
  `dimensionTenths : Nat := 15` = 一・五ミリメートル = 1.5 mm = 15 tenths
    (exact scaled integers, scale 10; no floating point).
  `exceedsCrossSection tenths := decide (dimensionTenths < tenths)`;
    「超える」 is STRICT `>`, so exactly 1.5 mm (15 tenths) does NOT exceed
    and 1.6 mm (16 tenths) does.

Scope: ONLY the explicit decimal threshold is modelled — 一・五ミリメートル =
15 tenths and 「超える」 = strict >. The goods classifications (第一号〜第三号),
the country of origin, the import period, the duty rate, the zinc-coating
process, other paragraphs/articles and every legal determination are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CrossSection15mm

/-- 一・五ミリメートル = 1.5 mm = 15 tenths-of-mm. Unit 1/10 mm; domain Nat. -/
def dimensionTenths : Nat := 15

/-- 「横断面の最大寸法が一・五ミリメートルを超えるもの」: strict 超え, i.e. 15 < tenths. -/
def exceedsCrossSection (tenths : Nat) : Bool :=
  decide (dimensionTenths < tenths)

/-- 14 tenths (1.4 mm) is below 一・五ミリメートル: does not exceed. -/
theorem below_false : exceedsCrossSection 14 = false := by
  unfold exceedsCrossSection dimensionTenths
  decide

/-- Exactly 一・五ミリメートル = 15 tenths: strict 超え excludes the boundary. -/
theorem at_false : exceedsCrossSection 15 = false := by
  unfold exceedsCrossSection dimensionTenths
  decide

/-- 16 tenths (1.6 mm) is the first value above 一・五ミリメートル: exceeds. -/
theorem above_true : exceedsCrossSection 16 = true := by
  unfold exceedsCrossSection dimensionTenths
  decide

/-- Zero cross-section dimension does not exceed the threshold. -/
theorem zero_false : exceedsCrossSection 0 = false := by
  unfold exceedsCrossSection dimensionTenths
  decide

/-- Direct-inequality form (no monotonicity typeclass): if `tenths` exceeds,
    any larger value exceeds too. -/
theorem exceedsCrossSection_of_lt {tenths tenths' : Nat}
    (h : exceedsCrossSection tenths = true) (hle : tenths <= tenths') :
    exceedsCrossSection tenths' = true := by
  unfold exceedsCrossSection dimensionTenths at h ⊢
  apply decide_eq_true
  have ht : 15 < tenths := of_decide_eq_true h
  omega

end JapanTaxLaw.CrossSection15mm
