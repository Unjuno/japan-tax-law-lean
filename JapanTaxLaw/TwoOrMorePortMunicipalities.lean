import JapanTaxLaw.TaxFinance

/-
# TwoOrMorePortMunicipalities — 特別とん譲与税法施行規則 第二条（二以上の開港所在市町村）

Pinned source:
  Law id: 332M50000002021 (特別とん譲与税法施行規則)
  Revision: 332M50000002021_20010106_412M50000008044
  Raw snapshot: data/raw/332M50000002021_20010106_412M50000008044.law.json
  Statutory article: 第二条 (art. 2), 第一項 見出し (ArticleCaption)
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/ArticleCaption
  Normative unit id: NORM|6d88a4e6ecbe918e329d10056884bbc867d8da77c28a12ef3c3e54354872b2e5

原文逐語（pinned, verbatim, CONDITION）:
  「（二以上の開港所在市町村の区域が一の税関の管轄区域に属する場合の譲与の基準）」

Variable contract:
  `ports : Nat` = the number of 開港所在市町村 whose areas belong to the
  single customs district in question. Unit: a count of municipalities;
  domain: Nat. `atLeastTwo ports` is true exactly when 二以上 (two or more)
  holds, i.e. `2 <= ports`.

Scope: ONLY the count condition 「二以上の開港所在市町村 … 一の税関の管轄区域に属する場合」 is modelled. The grant basis itself (譲与の基準), the identity of the municipalities and customs district, and all other provisions are NOT MODELLED. This is a caption-level condition unit; no amount formula is asserted.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TwoOrMorePortMunicipalities

/-- 二以上 — the statutory minimum count of municipalities. Unit: count; domain: Nat. -/
def minimumPorts : Nat := 2

/-- 「二以上の開港所在市町村」: the count condition on the customs district. -/
def atLeastTwo (ports : Nat) : Bool :=
  decide (minimumPorts <= ports)

theorem one_port_false : atLeastTwo 1 = false := by
  unfold atLeastTwo minimumPorts
  decide

theorem two_ports_true : atLeastTwo 2 = true := by
  unfold atLeastTwo minimumPorts
  decide

theorem three_ports_true : atLeastTwo 3 = true := by
  unfold atLeastTwo minimumPorts
  decide

end JapanTaxLaw.TwoOrMorePortMunicipalities
