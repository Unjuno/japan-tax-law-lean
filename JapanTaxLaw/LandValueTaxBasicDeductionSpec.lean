import JapanTaxLaw.LandValueTaxBasicDeduction

/-!
# LandValueTaxBasicDeduction spec — 地税法 art. 18（基礎控除）の独立整数定式

Sources (pinned; identical to LandValueTaxBasicDeduction.lean):

  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068
  Amendment enforcement date: 2025-06-01
  Raw snapshot: data/raw/403AC0000000069_20250601_504AC0000000068.law.json

This file restates the statutory arithmetic independently in plain `Nat`, without
referencing any implementation constant or def: the amounts are bare literals read
from 原文「十億円」(1_000_000_000), 「十五億円」(1_500_000_000), 「三万円」(30_000),
「二分の一」(prev 1/2); the ratio/half application is written as raw `m * num / den`
instead of reusing `TaxRate.applyFloor`; the max is written as `specMax`
(`if a ≤ b then b else a`) instead of `max`. Only the plumbing that converts
caller-established impl inputs into spec codes refers to the impl types.

`agreeLandValueTaxBasicDeduction` checks that implementation and this independent
restatement coincide on a finite grid (kernel `decide`); it is NOT a universal claim.

Scope boundaries are identical to the implementation: owner classification,
leasehold/underlying-land classification, ratios, 前条 applicability, areas and
mutual-company status are all caller-established and never derived inside this
model. Only the deduction arithmetic is modelled.
-/ 

namespace JapanTaxLaw.LandValueTaxBasicDeduction

-- ==== art. 18: 独立定式（impl の定数・def を参照しない） ====

/-- 一号イ「十億円」。 -/
def specItem1Large : Nat := 1_000_000_000

/-- 一号ロ「十五億円」。 -/
def specItem1Other : Nat := 1_500_000_000

/-- 二号「三万円」。 -/
def specUnitBase : Nat := 30_000

/-- 一号金額。owner 0 = イ、それ以外 = ロ。 -/
def specItem1 (owner : Nat) : Nat :=
  if owner = 0 then specItem1Large else specItem1Other

/-- 二号の一平方メートル当たり金額。land 0 = イ（割合を無視）、1 = ロ（借地権割合）、
    2 = ハ（底地割合）。割合・前条係数を素の Nat 分数として受け取る。
    impl の `TaxRate.applyFloor` を再利用せず、乗除を書き下ろす。 -/
def specUnitPrice (land ratioNum ratioDen prevNum prevDen : Nat) : Nat :=
  let base :=
    if land = 0 then specUnitBase
    else specUnitBase * ratioNum / ratioDen
  base * prevNum / prevDen

/-- spec 側の区画（impl の `Parcel` を参照せず、素の Nat のみ）。 -/
structure SpecParcel where
  land     : Nat
  ratioNum : Nat
  ratioDen : Nat
  prevNum  : Nat
  prevDen  : Nat
  area     : Nat

/-- 一区画の二号金額 = 単価 × 面積。 -/
def specParcelAmount (p : SpecParcel) : Nat :=
  specUnitPrice p.land p.ratioNum p.ratioDen p.prevNum p.prevDen * p.area

/-- 二号金額 = 「単価 × 面積」の合計額。 -/
def specItem2 (ps : List SpecParcel) : Nat :=
  (ps.map specParcelAmount).sum

/-- 「いずれか多い金額」（impl の `max` に依存しない書き下ろし）。 -/
def specMax (a b : Nat) : Nat :=
  if a ≤ b then b else a

/-- 基礎控除 = max(一号金額, 二号金額)。 -/
def specBasicDeduction (owner : Nat) (ps : List SpecParcel) : Nat :=
  specMax (specItem1 owner) (specItem2 ps)

-- ==== points（独立定式のスモーク、全境界値） ====

example : specItem1Large = 1_000_000_000 := by decide
example : specItem1Other = 1_500_000_000 := by decide
example : specUnitBase = 30_000 := by decide
example : specItem1 0 = 1_000_000_000 := by decide
example : specItem1 1 = 1_500_000_000 := by decide
example : specMax 3 5 = 5 := by decide
example : specMax 5 3 = 5 := by decide
example : specMax 5 5 = 5 := by decide

example : specUnitPrice 0 1 1 1 1 = 30_000 := by decide
example : specUnitPrice 0 1 1 1 2 = 15_000 := by decide
example : specUnitPrice 1 7 10 1 1 = 21_000 := by decide
example : specUnitPrice 1 7 10 1 2 = 10_500 := by decide
example : specUnitPrice 2 3 10 1 1 = 9_000 := by decide
example : specUnitPrice 2 3 10 1 2 = 4_500 := by decide
example : specUnitPrice 1 0 1 1 1 = 0 := by decide

example : specParcelAmount { land := 0, ratioNum := 1, ratioDen := 1, prevNum := 1, prevDen := 1, area := 100 } = 3_000_000 := by decide
example : specParcelAmount { land := 0, ratioNum := 1, ratioDen := 1, prevNum := 1, prevDen := 2, area := 100 } = 1_500_000 := by decide
example : specItem2 [] = 0 := by decide

example : specBasicDeduction 0 [] = 1_000_000_000 := by decide
example : specBasicDeduction 1 [] = 1_500_000_000 := by decide
example : specBasicDeduction 0 [{ land := 0, ratioNum := 1, ratioDen := 1, prevNum := 1, prevDen := 1, area := 40_000 }] = 1_200_000_000 := by decide

-- ==== plumbing: caller-established impl 入力 → spec コード ====

/-- impl の区分を spec の owner コードへ（イ → 0、ロ → 1）。 -/
def specOwnerCode (o : OwnerClass) : Nat :=
  match o with
  | .largeCorp => 0
  | .individualOrOther => 1

/-- impl の区分を spec の land コードへ（イ → 0、ロ → 1、ハ → 2）。 -/
def specLandCode (c : LandClass) : Nat :=
  match c with
  | .noLeasehold => 0
  | .leaseholdRight => 1
  | .underlyingLand => 2

/-- impl の区画を spec の区画へ（算術は一切行わず、値を移すだけ）。 -/
def toSpecParcel (p : Parcel) : SpecParcel :=
  { land := specLandCode p.cls,
    ratioNum := p.ratio.num, ratioDen := p.ratio.den,
    prevNum := p.prev.num, prevDen := p.prev.den,
    area := p.area }

-- ==== 有限グリッド ====

def sampleParcels : List Parcel :=
  [ { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 0 }
  , { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1 }
  , { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 }
  , { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 2, by decide⟩, area := 100 }
  , { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 40_000 }
  , { cls := .leaseholdRight, ratio := ⟨7, 10, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 }
  , { cls := .leaseholdRight, ratio := ⟨7, 10, by decide⟩, prev := ⟨1, 2, by decide⟩, area := 1_000 }
  , { cls := .leaseholdRight, ratio := ⟨0, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 }
  , { cls := .underlyingLand, ratio := ⟨3, 10, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 }
  , { cls := .underlyingLand, ratio := ⟨3, 10, by decide⟩, prev := ⟨1, 2, by decide⟩, area := 1_000 }
  ]

-- ==== agreement（impl ↔ spec、有限点のみ；全称主張ではない） ====

/-- 実装と独立定式が有限グリッド上で一致するか。定数・単価・区画金額・一号・二号・
    基礎控除を比較する（列挙された点のみ；全称主張ではない）。 -/
def agreeLandValueTaxBasicDeduction : Bool :=
  let owners := [OwnerClass.largeCorp, OwnerClass.individualOrOther]
  let psets : List (List Parcel) :=
    [[], sampleParcels, sampleParcels.reverse, sampleParcels ++ sampleParcels]
  (specItem1Large == item1LargeCorpAmount) &&
  (specItem1Other == item1OtherAmount) &&
  (specUnitBase == unitPriceBase) &&
  (sampleParcels.all fun p =>
    unitPricePerSqm p.cls p.ratio p.prev ==
      specUnitPrice (specLandCode p.cls) p.ratio.num p.ratio.den p.prev.num p.prev.den) &&
  owners.all fun o =>
    (item1Amount o == specItem1 (specOwnerCode o)) &&
    psets.all fun ps =>
      let sps := ps.map toSpecParcel
      (item2Amount ps == specItem2 sps) &&
      (basicDeduction o ps == specBasicDeduction (specOwnerCode o) sps)

example : agreeLandValueTaxBasicDeduction = true := by decide

end JapanTaxLaw.LandValueTaxBasicDeduction
