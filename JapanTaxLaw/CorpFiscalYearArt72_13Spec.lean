/-\!
# CorpFiscalYearArt72_13Spec — 独立形式仕様

地方税法第七十二条の十三から独立。実装を import しない。
日を Nat とし、事業年度を (開始日, 終了日) とする。
-/
namespace JapanTaxLaw.CorpFiscalYearArt72_13Spec

abbrev DaySpec := Nat
abbrev FiscalYearSpec := Nat × Nat

def defaultCalendarYearSpec : FiscalYearSpec := (1, 365)
def endAtBoundarySpec (d : DaySpec) : DaySpec := d - 1
def startAtBoundarySpec (d : DaySpec) : DaySpec := d
def nextYearStartSpec (d : DaySpec) (suppress : Bool) (specialEnd : DaySpec) : DaySpec :=
  if suppress then specialEnd else d
def consolidatedStartSpec (ps : DaySpec) : DaySpec := ps
def consolidatedEndSpec (pe : DaySpec) : DaySpec := pe

end JapanTaxLaw.CorpFiscalYearArt72_13Spec
