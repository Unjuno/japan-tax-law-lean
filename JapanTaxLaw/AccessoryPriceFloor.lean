import JapanTaxLaw.TaxFinance

/-!
# AccessoryPriceFloor — 自家用自動車の一時輸入に関する通関条約の実施に伴う関税法等の特例に関する法律施行令 第二条

Pinned source:
  Law id: 339CO0000000182
  Official title: 自家用自動車の一時輸入に関する通関条約の実施に伴う関税法等の特例に関する法律施行令
  Law number: 昭和三十九年政令第百八十二号
  Law type: CabinetOrder (政令)
  Revision: 339CO0000000182_20030401_415CO0000000142
  Raw snapshot: data/raw/339CO0000000182_20030401_415CO0000000142.law.json
  sha256: 086ef9dd9fc2f555fa952772e0be9e7f93f94f6decd7925e103490542331c0e6
  Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2")

原文逐語（pinned, 一字一句改変なし）:
  「前二号に掲げるもののほか、車両の附属品であつて価格が一万円以上のもの」

Variable contract:
  `price : Nat` = 価格 (price of a vehicle accessory), unit 円, whole yen.
  `accessoryPriceFloor : Nat := 10_000` = 一万円 (10,000 yen).
  `isQualifyingAccessory price := decide (accessoryPriceFloor <= price)`.
  「以上」 is INCLUSIVE (>=), so exactly 一万円 qualifies; 「一万円」 = 10,000.
  The domain is Nat (non-negative whole yen); no fractional yen is represented.

Scope: ONLY the explicit numeric price floor in this item is modelled.
  The preceding two items (前二号), the substantive rule this item gates,
  other articles, 省令 details and the temporary-import procedure itself are
  NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.AccessoryPriceFloor

open JapanTaxLaw.TaxFinance

/-- 一万円 = 10,000 円. Unit 円; domain Nat. -/
def accessoryPriceFloor : Nat := 10_000

/-- 「価格が一万円以上」: accessory price is at least ¥10,000 (以上 = >=). -/
def isQualifyingAccessory (price : Nat) : Bool :=
  decide (accessoryPriceFloor <= price)

/-- 9,999 < 10,000: the price below the floor does NOT qualify. -/
theorem below_floor_false : isQualifyingAccessory 9_999 = false := by
  unfold isQualifyingAccessory accessoryPriceFloor
  decide

/-- Exactly 10,000 qualifies: 以上 is inclusive. -/
theorem at_floor_true : isQualifyingAccessory 10_000 = true := by
  unfold isQualifyingAccessory accessoryPriceFloor
  decide

/-- 10,001 > 10,000: a price above the floor qualifies. -/
theorem above_floor_true : isQualifyingAccessory 10_001 = true := by
  unfold isQualifyingAccessory accessoryPriceFloor
  decide

/-- Zero yen is below the floor. -/
theorem zero_false : isQualifyingAccessory 0 = false := by
  unfold isQualifyingAccessory accessoryPriceFloor
  decide

/-- Monotone in the price: raising an already-qualifying price keeps it qualifying. -/
theorem monotone {price price' : Nat}
    (h : isQualifyingAccessory price = true) (hle : price <= price') :
    isQualifyingAccessory price' = true := by
  unfold isQualifyingAccessory accessoryPriceFloor at h ⊢
  apply decide_eq_true
  have hp : 10_000 <= price := of_decide_eq_true h
  omega

end JapanTaxLaw.AccessoryPriceFloor
