/-\!
# TreatyJPUSCapitalGains — 日米租税条約 第十三条（譲渡所得）

L3 条約層（別層）。第十三条の課税配分構造のみをカーネル証明する：
- １３１：他方の締約国内に存在する不動産の譲渡収益は、当該他方で課税可。
- １３２：「不動産」には第六条の不動産に加え、資産価値が主として国内不動産で
  構成される法人・組合・信託の株式／持分（日本側）、米国不動産持分（米国側）を含む。
- １３３：一定の株式譲渡（不動産関連持分等）は譲渡時に居住国で課税される場合がある。
- 事業用動産の譲渡益は第七条（恒久的施設帰属）の対象。

具体的な財産・金額・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSCapitalGains

-- １３１：不動産譲渡益は所在地国で課税可
def gainsTaxableInSource (immovableInSource : Bool) : Bool := immovableInSource
theorem immovable_gains_source_tax : gainsTaxableInSource true = true := by decide
theorem non_immovable_no_source_tax : gainsTaxableInSource false = false := by decide

-- １３２：不動産の定義拡張（第六条不動産 又は 株式Proxy 又は 米国USRPI）
def isImmovable (art6Prop shareProxy usRPI : Bool) : Bool := art6Prop || shareProxy || usRPI
theorem art6_property_is_immovable : isImmovable true false false = true := by decide
theorem share_proxy_is_immovable : isImmovable false true false = true := by decide
theorem us_rpi_is_immovable : isImmovable false false true = true := by decide
theorem non_immovable : isImmovable false false false = false := by decide

-- 定義拡張は元の範囲を含む（包含は反射的・拡張的）
theorem art6_subset_immovable (a s u : Bool) (h : a = true) : isImmovable a s u = true := by simp [isImmovable, h]

def capitalGainsDeclared : Bool := true
theorem capital_gains_is_declaration : capitalGainsDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSCapitalGains
