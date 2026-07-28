import BioinformaticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  informationBound : String
  carriedRemainder : String

def sourceRepository : String := "bioinformatics-canonical-lane"
def sourceDescription : String := "Shannon source coding theorem"
def sourceTheoremBoundary : String := "classical boundary on entropy rate"

def defaultTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := sourceTheoremBoundary,
  informationBound := "H(X) ≤ R ≤ C",
  carriedRemainder := "Shannon limit carried as remainder"
}

end BioinformaticsCanonicalLaneLean
end HautevilleHouse