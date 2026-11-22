import JapanTaxLaw.TaxFinance

/-!
# ElectronicSystemDesignation — 処分通知等に係る電子情報処理組織（省令 art.7の2）bounded L4 モデル

Sources (pinned):
  Law id: 415M60000040007
  Revision: 415M60000040007_20251012_507M60000040035
  Raw snapshot: data/raw/415M60000040007_20251012_507M60000040035.law.json
  Article Num 7_2, flat/normalized leaf text 77 chars, U+3000 count 0.

原文逐語:
  「情報通信技術活用法第七条第一項に規定する主務省令で定める電子情報処理組織は、
   輸出入等関連情報処理組織とする。」

Computation（原文逐語から導出、指定組織の列挙のみ）:
  指定組織 = {輸出入等関連情報処理組織}（ただ 1 つのみ）
  組織を Nat 列挙: 輸出入等関連情報処理組織=0, その他=1
  isDesignatedSystem(s) = (s == 0)

Scope / NOT MODELLED:
  - 情報通信技術活用法7条1項の定義・主務省令の全体は NOT MODELLED。
  - 「輸出入等関連情報処理組織」の技術的範囲・運用は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ElectronicSystemDesignation

open JapanTaxLaw.TaxFinance

/-- 輸出入等関連情報処理組織 = 0。 -/
def importExportSystem : Nat := 0
/-- その他 = 1。 -/
def otherSystem : Nat := 1

/-- 主務省令で定める電子情報処理組織（輸出入等関連情報処理組織）か。 -/
def isDesignatedSystem (system : Nat) : Bool :=
  system == importExportSystem

example : isDesignatedSystem importExportSystem = true := by decide
example : isDesignatedSystem otherSystem = false := by decide

end JapanTaxLaw.ElectronicSystemDesignation
