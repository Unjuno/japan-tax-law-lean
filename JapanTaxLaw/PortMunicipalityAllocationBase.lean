/-!
# PortMunicipalityAllocationBase — 特別とん譲与税法 第二条第二項（CONDITION）

Sources (pinned): law `332AC0000000077` / rev `332AC0000000077_20010106_411AC0000000160`.
Raw snapshot: `data/raw/332AC0000000077_20010106_411AC0000000160.law.json`.

原文:
「前項の場合において、一の開港に係る開港所在市町村が二以上あるときは、当該二以上の開港所在市町村の区域を管轄区域とする税関（当該開港所在市町村の区域を管轄区域とする税関の支署若しくは出張所又は支署の出張所があるときは、当該税関の支署若しくは出張所又は支署の出張所とする。以下同じ。）に係る特別とん税の収入額に相当する額を当該開港所在市町村に対して譲与するものとする。」

Computation: 開港所在市町村が二以上（inclusive `>= 2`）のとき、譲与の算定基礎を
「開港に係る収入額」から「当該税関に係る特別とん税の収入額」へ切り替える。
Scope: 税関の支署・出張所の特定、同一管轄区域の場合のあん分（総務省令）は NOT MODELLED。
法的レビューを提供しない。
-/

namespace JapanTaxLaw.PortMunicipalityAllocationBase

/-- 二以上: inclusive threshold. -/
def threshold : Nat := 2

/-- 二以上の開港所在市町村があるときは税関収入額、それ以外は開港収入額。 -/
def allocationBase (n : Nat) (portRevenue : Nat) (customsRevenue : Nat) : Nat :=
  if n >= threshold then customsRevenue else portRevenue

example : allocationBase 0 100 7 = 100 := by decide
example : allocationBase 1 100 7 = 100 := by decide
example : allocationBase 2 100 7 = 7 := by decide
example : allocationBase 3 100 7 = 7 := by decide
example : allocationBase 2 0 0 = 0 := by decide

end JapanTaxLaw.PortMunicipalityAllocationBase
