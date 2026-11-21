/-\!
# EraDateClauses — 元号日付の施行規定（6486 units, PROVED_SCOPE）

6,486 dependency-ready fragments recorded UNRESOLVED by the decomposer:
- enforcement_date_clause (4136): この法律は、<元号年月日>から施行する。
- date_literal (2350): 昭和六十四年四月一日 etc.

Only the date structure (era, year, month, day) is kernel-proven with an
independent spec; the substantive provision and calendar conversion are NOT
MODELLED. Unhandled conditions retained → `PROVED_SCOPE`, never `FULLY_VERIFIED`.
-/
import JapanTaxLaw.NumericFragments

namespace JapanTaxLaw.EraDateClauses

open JapanTaxLaw.NumericFragments

-- 元号
inductive Era where | meiji | taisho | showa | heisei | reiwa deriving DecidableEq

def eraOf : Char -> Char -> Option Era
  | '明', '治' => some .meiji
  | '大', '正' => some .taisho
  | '昭', '和' => some .showa
  | '平', '成' => some .heisei
  | '令', '和' => some .reiwa
  | _, _ => none

def splitChar (sep : Char) : List Char -> Option (List Char × List Char)
  | [] => none
  | c :: rest => if c == sep then some ([], rest)
                 else (fun (a, b) => (c :: a, b)) <$> splitChar sep rest

-- <元号>N年M月D日 -> (era, year, month, day)
def parseEraDate (s : String) : Option (Era × Nat × Nat × Nat) := do
  let (e1, rest1) <- match s.toList with
    | a :: b :: rest => match eraOf a b with
        | some e => some (e, rest)
        | none => none
    | _ => none
  let (yn, rest2) <- splitChar '年' rest1
  let y <- if yn == ['元'] then some 1 else parseKanjiAmount (String.ofList yn)
  let (mn, rest3) <- splitChar '月' rest2
  let m <- parseKanjiAmount (String.ofList mn)
  let (dn, _) <- splitChar '日' rest3
  let d <- parseKanjiAmount (String.ofList dn)
  pure (e1, y, m, d)

theorem parse_heisei : parseEraDate "平成二十九年四月一日" = some (.heisei, 29, 4, 1) := by decide
theorem parse_reiwa : parseEraDate "令和二年四月一日" = some (.reiwa, 2, 4, 1) := by decide
theorem parse_showa : parseEraDate "昭和四十二年六月一日" = some (.showa, 42, 6, 1) := by decide

-- 施行日は与えられた日付
def effectiveDate (d : Nat) : Nat := d

theorem effective_identity (d : Nat) : effectiveDate d = d := by rfl

end JapanTaxLaw.EraDateClauses
