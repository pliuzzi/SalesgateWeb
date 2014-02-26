package eu.a2a.salesgate.pratiche.gas.bean;

public class HtmlHelper {

	private String templateFormItem = "<div class=\"col-lg-4\"> "
			+ "  <div class=\"form-group\"> "
			+ "    <form:label path=\"lavoriGasExtension.{0}\" class=\"col-lg-6 control-label\">{0}</form:label> "
			+ "      <div class=\"col-lg-6\"> "
			+ "        <spring:bind path=\"lavoriGasExtension.{0}\" > "
			+ "          <form:input type=\"text\" class=\"form-control input-sm ${status.error ? 'alert-danger' : ''}\" path=\"${status.expression}\" "
			+ "            readonly=\"${lavoriGas.isLavoriGasEditable}\"  "
			+ "            data-toggle=\"tooltip\" title=\"${status.errorMessage}\" data-container=\"body\" data-placement=\"right\"/> "
			+ "        </spring:bind> " + "      </div> " + "    </div> "
			+ "  </div>";

	private String aperturaRiga = "<div class=\"row\">";
	private String chiusuraRiga = "</div>";

	private String[] arrayItems = { "accMis", "annoFabbGdm", "annoFabbMis",
			"annoFabNuovoMis", "addebitoOneri", "alimentBp", "aliquotaIva",
			"attiAutorizzativi", "autoLettFatt", "categoriaUso",
			"causaleAnnullam", "causaleLabVerif", "causeLab",
			"classeGruppoMis", "classeNuovoMis", "classePrelievo",
			"codiceContratto", "codiceRemi", "codPratRif", "codPrevDl",
			"codPrevMor", "codProfiloPrel", "codRinSosMor", "codTipPre",
			"coeffCorr", "competenzaLettura", "confermaCliente",
			"costoLabPrev", "costoLoco", "costoPrev", "daEseguireNonPrimaDel",
			"datiFatturazione", "datiTecnRic", "descCategoriaUso",
			"descClassePrelievo", "descCompetenzaLettura", "descLavoro",
			"descPeriodLettura", "descQualificaClf", "dettaglioVerificaEsito",
			"documMancante", "erogServEner", "esito", "esitoAccertamento",
			"esitoConferma", "esitoDocum", "esitoProcesso",
			"esitoValAutolettura", "gestoreCalore", "imposteAgevolate",
			"indDistr", "indInvioDocum", "instConv", "instMis", "iva",
			"maxPotUtilizzazione", "maxPrelOra", "mortisCausa", "nessIntGiud",
			"nominativoUtf", "nPdrAttivi", "numChiave",
			"numeroRichiestaVenditore", "numeroServizioVenditore",
			"nuovoTentativo", "onOff", "pdfVenditore", "pdrCodProfPrel",
			"pdrTipo", "periodLettura", "pivaSocietaRichiedente",
			"potMaxCliente", "potMaxRichiesta", "potTotInst", "potTotUtil",
			"prelAnnuoPrev", "pressioneMisura", "qualificaClf", "reclamo",
			"resoconto", "responsabileImpianto", "revocaDisattivazione",
			"richVarDati", "rifComunicDocum", "rifComunSosp", "rifPreventivo",
			"rifQuesiti", "rifReclamo", "rifResocontoVerif", "rifRispQuesiti",
			"rilevanza", "segmentoCliente", "sospPotPericolo",
			"statoElaborazione", "stimaTempiVerif", "strutturaDatiTecnici",
			"telefonoRespImpianto", "tipoAnomaliaCodificata", "tipoLavoro",
			"tipoLettura", "tipoLetturaCl", "tipoLettverif",
			"tipologiaAppartenenza", "tipologiaPdr", "tipologiaUtenza",
			"tipologiaVoltura", "tipoServizio", "valoreLettura",
			"valoreLetturaCl", "valoreLettVerif", "verifLabVerif",
			"volumiAnnui" };

	private String getFormItem(String formItem) {

		return templateFormItem.replace("{0}", formItem);

	}

	public String createElements() {

		String ret = "";

		for (int i = 0; i < arrayItems.length; i++) {

			if (i % 3 == 0) {
				if (i > 0) {
					ret += chiusuraRiga;
				}
				ret += aperturaRiga;
			}
			ret += getFormItem(arrayItems[i]);

		}

		return ret;

	}

	public static void main(String[] args) {

		HtmlHelper hh = new HtmlHelper();
		System.out.println(hh.createElements());

	}

}