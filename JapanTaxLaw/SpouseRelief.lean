import JapanTaxLaw.TaxFinance

/-!
# SpouseRelief — 相続税法 art. 19-2 (配偶者に対する相続税額の軽減) L4 slice

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Art. 19-2 text components:

  第一号：配偶者につき第15条から第17条まで及び前条の規定により算出した金額
  第二号：当該相続又は遺贈により財産を取得した全ての者に係る相続税の総額に、
          次に掲げる金額のうちいずれか少ない金額が当該相続又は遺贈により
          財産を取得した全ての者に係る相続税の課税価格の合計額のうちに占める
          割合を乗じて算出した金額
   イ 当該相続又は遺贈により財産を取得した全ての者に係る相続税の課税価格の
      合計額に民法第九百条の規定による当該配偶者の相続分を乗じて算出した金額
      （当該被相続人の相続人が当該配偶者のみである場合には、当該合計額）に
      相当する金額（当該金額が一億六千万円に満たない場合には、一億六千万）
   ロ 当該相続又は遺贈により財産を取得した配偶者に係る相続税の課税価格に
      相当する金額

  軽減額 = 第一号 amount − 第二号 amount  (now absorbed silently into art. 19-2
  totals). We implement: tax owed after the spouse relief, i.e.

    relief = taxBeforeRelief * min(shareBasis, spouseAcquisition) / totalAcquisition
    taxAfter = taxBeforeRelief − relief

  where
    shareBasis = if spouseIsOnlyHeir then totalAcquisition
                 else max(legalShareRaw, 160_000_000)
    spouseIsOnlyHeir : spouse is the only legal heir (民法第九百条 quotation)

Cond. of application (not coded here — out of scope per 料率/条件限定):

  - the spouse relief applies **once per lifetime** ( art. 19-2(1) does not
    exclude reuse); art. 19-2(2) splits the benefit for partial-
    settlements within the filing window (3 years); art.19-2(3) and
    art.19-2(5) procedural bookkeeping. The §2/§3/§4 conditions
    (財産分割未了い場合の対応・隠蔽仮装行為の防止) are out of scope; the
    light-model computes the relief for the fully-allocated scenario.

Scope limit: the computations 入口 = 配偶者の相続分 (民法 art. 900) and the
配偶者の課税価格 are caller-supplied. This module does not verify
inheritance-civil law; all statutes are outside the pinned law scope here.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Exact inputs for one computation of art. 19-2. All fields supplied by
    the caller (heir-distribution facts). -/
structure SpouseReliefFacts where
  /-- 配偶者の法定相続分の割合に対応する課税価格 (min(a = 法定相続分×総額, ...) as raw) -/
  spouseLegalShareRaw : Money
  /-- 配偶者の取得した財産の課税価格が占める割合 — the amount spouse actually
      obtained (ロ) in yen (額×割合, directly comparable to イ). -/
  spouseAcquisition : Money
  /-- 相続人全員に係る課税価格の合計額 -/
  totalAcquisition : Money
  /-- art. 15–17+18 で算出した金額（第一号）— reliefの基礎 -/
  taxBeforeRelief : Money
  /-- 被相続人の相続人が配偶者のみか -/
  spouseIsOnlyHeir : Bool
  deriving DecidableEq, Repr

/-- The イ (art. 19-2 二号イ) amount in yen. -/
def spouseReliefYiBasis (f : SpouseReliefFacts) : Money :=
  if f.spouseIsOnlyHeir then
    f.totalAcquisition
  else
    -- 一億六千万円が下限（未満とは）: 民法九百条の配偶者の相続分の額
    if f.spouseLegalShareRaw < 160_000_000 then 160_000_000 else f.spouseLegalShareRaw

/-- The art. 19-2(2) イ basis × ロの小さい方 (art. 19-2(2)二号:
    min of [イ, ロ] = the relevant one for the computation). -/
def spouseReliefRelevantBasis (f : SpouseReliefFacts) : Money :=
  let yi := spouseReliefYiBasis f
  if yi ≤ f.spouseAcquisition then yi else f.spouseAcquisition

/-- Art. 19-2(2) 軽減 montant — proportion of total acquisition × total tax. -/
def spouseRelief (f : SpouseReliefFacts) : Money :=
  if f.totalAcquisition = 0 then 0
  else (f.taxBeforeRelief * spouseReliefRelevantBasis f) / f.totalAcquisition

/-- The tax after art. 19-2 relief — subtracts the relief amount. -/
def taxAfterSpouseRelief (f : SpouseReliefFacts) : Money :=
  f.taxBeforeRelief - spouseRelief f

-- ==== verified facts ====

/-- If the spouse is the only heir, the basis is total acquisition itself. -/
theorem spouseReliefYiBasis_of_onlyHeir (f : SpouseReliefFacts) (h : f.spouseIsOnlyHeir = true) :
    spouseReliefYiBasis f = f.totalAcquisition := by
  unfold spouseReliefYiBasis
  simp [h]

/-- Otherwise the basis is at least ¥160,000,000 (art. 19-2(1) イ bottom amount). -/
theorem spouseReliefYiBasis_ge_160m_of_not_onlyHeir (f : SpouseReliefFacts)
    (h : f.spouseIsOnlyHeir = false) :
    160_000_000 ≤ spouseReliefYiBasis f := by
  unfold spouseReliefYiBasis
  rw [h]
  by_cases hh : f.spouseLegalShareRaw < 160_000_000
  · rw [ite_eq_left hh]
    exact Nat.le_refl 160_000_000
  · rw [ite_eq_right hh]
    exact Nat.le_of_not_lt hh

/-- The portion used in the rate is no greater than the spouse's own acquisition. -/
theorem spouseReliefRelevantBasis_le_spouseAcquisition (f : SpouseReliefFacts) :
    spouseReliefRelevantBasis f ≤ f.spouseAcquisition := by
  unfold spouseReliefRelevantBasis
  by_cases h : spouseReliefYiBasis f ≤ f.spouseAcquisition
  · rw [ite_eq_left h]
    exact h
  · rw [ite_eq_right h]
    exact Nat.le_refl _

/-- The relief amount does not exceed the tax before relief (consistent-input case). -/
theorem spouseRelief_le_taxBeforeRelief (f : SpouseReliefFacts)
    (h : f.spouseAcquisition ≤ f.totalAcquisition) (ht : f.totalAcquisition ≠ 0) :
    spouseRelief f ≤ f.taxBeforeRelief := by
  unfold spouseRelief
  rw [ite_eq_right (fun e => ht e)]
  have hb : spouseReliefRelevantBasis f ≤ f.totalAcquisition :=
    Nat.le_trans (spouseReliefRelevantBasis_le_spouseAcquisition f) h
  have hmul : f.taxBeforeRelief * spouseReliefRelevantBasis f ≤ f.totalAcquisition * f.taxBeforeRelief := by
    have e := Nat.mul_comm f.taxBeforeRelief f.totalAcquisition
    calc f.taxBeforeRelief * spouseReliefRelevantBasis f
        ≤ f.taxBeforeRelief * f.totalAcquisition := Nat.mul_le_mul_left f.taxBeforeRelief hb
      _ = f.totalAcquisition * f.taxBeforeRelief := e
  exact Nat.div_le_of_le_mul hmul

/-- Zero tax stays zero relief. -/
theorem spouseRelief_zero_of_zero_tax (f : SpouseReliefFacts) (h : f.taxBeforeRelief = 0) :
    spouseRelief f = 0 := by
  unfold spouseRelief
  rw [h]
  simp

/-- Tax after spouse relief never exceeds the tax before relief. -/
theorem taxAfterSpouseRelief_le_taxBeforeRelief (f : SpouseReliefFacts) :
    taxAfterSpouseRelief f ≤ f.taxBeforeRelief := Nat.sub_le _ _

def f1 : SpouseReliefFacts := ⟨100_000_000, 90_000_000, 300_000_000, 30_000_000, false⟩
/-- share below 1.6億 → floor applies -/
example : spouseReliefYiBasis f1 = 160_000_000 := by decide

def f2 : SpouseReliefFacts := ⟨250_000_000, 240_000_000, 500_000_000, 80_000_000, false⟩
/-- share above 1.6億 → share used as-is -/
example : spouseReliefYiBasis f2 = 250_000_000 := by decide

def f3 : SpouseReliefFacts := ⟨80_000_000, 80_000_000, 500_000_000, 80_000_000, true⟩
/-- spouse-only heir: イ = total acquisition amount -/
example : spouseReliefYiBasis f3 = 500_000_000 := by decide

def f4 : SpouseReliefFacts := ⟨200_000_000, 90_000_000, 400_000_000, 10_000_000, false⟩
example : spouseReliefRelevantBasis f4 = 90_000_000 := by decide

def f5 : SpouseReliefFacts := ⟨200_000_000, 250_000_000, 400_000_000, 10_000_000, false⟩
example : spouseReliefRelevantBasis f5 = 200_000_000 := by decide

def f6 : SpouseReliefFacts := ⟨200_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩
example : spouseRelief f6 = 5_000_000 := by decide

/-- 1.6億 floor active: relevant basis = 160,000,000 → 40% × 10,000,000 = 4,000,000 -/
def f7 : SpouseReliefFacts := ⟨100_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩
example : spouseRelief f7 = 4_000_000 := by decide

/-- spouse-only heir: full relief eligible -/
def f8 : SpouseReliefFacts := ⟨0, 400_000_000, 400_000_000, 100_000_000, true⟩
example : spouseRelief f8 = 100_000_000 := by decide

/-- zero total acquisition → zero relief -/
def f9 : SpouseReliefFacts := ⟨0, 0, 0, 100, false⟩
example : spouseRelief f9 = 0 := by decide

end JapanTaxLaw
