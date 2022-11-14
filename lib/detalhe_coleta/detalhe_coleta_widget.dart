import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class DetalheColetaWidget extends StatefulWidget {
  const DetalheColetaWidget({
    Key? key,
    this.coletaselecionada,
  }) : super(key: key);

  final DocumentReference? coletaselecionada;

  @override
  _DetalheColetaWidgetState createState() => _DetalheColetaWidgetState();
}

class _DetalheColetaWidgetState extends State<DetalheColetaWidget> {
  AudioPlayer? soundPlayer;
  var scaneado = '';
  TextEditingController? avulsoController;
  TextEditingController? reversoController;
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    avulsoController = TextEditingController();
    reversoController = TextEditingController();
  }

  @override
  void dispose() {
    avulsoController?.dispose();
    reversoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ColetasRecord>(
      stream: ColetasRecord.getDocument(widget.coletaselecionada!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final detalheColetaColetasRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              context.pushNamed('inicial');
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFF2F3437),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/images/logmais.svg',
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            detalheColetaColetasRecord.cliente!,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF17191A),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            dateTimeFormat(
                                'd/M/y', detalheColetaColetasRecord.data!),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Tota  coletado:  ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF354088),
                                          fontSize: 16,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().totalcoletado.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF354088),
                                          fontSize: 20,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: Color(0xFF3662D7),
                                unselectedLabelColor: Color(0xFF2F3437),
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                indicatorColor: Color(0xFF959D9E),
                                tabs: [
                                  Tab(
                                    text: 'Mapa',
                                  ),
                                  Tab(
                                    text: 'Objetos',
                                  ),
                                  Tab(
                                    text: 'Coletados',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Builder(builder: (context) {
                                      final _googleMapMarker =
                                          detalheColetaColetasRecord;
                                      return FlutterFlowGoogleMap(
                                        controller: googleMapsController,
                                        onCameraIdle: (latLng) =>
                                            googleMapsCenter = latLng,
                                        initialLocation: googleMapsCenter ??=
                                            detalheColetaColetasRecord.local!,
                                        markers: [
                                          FlutterFlowMarker(
                                            _googleMapMarker.reference.path,
                                            _googleMapMarker.local!,
                                          ),
                                        ],
                                        markerColor: GoogleMarkerColor.violet,
                                        mapType: MapType.normal,
                                        style: GoogleMapStyle.standard,
                                        initialZoom: 14,
                                        allowInteraction: true,
                                        allowZoom: true,
                                        showZoomControls: true,
                                        showLocation: true,
                                        showCompass: false,
                                        showMapToolbar: false,
                                        showTraffic: true,
                                        centerMapOnMarkerTap: true,
                                      );
                                    }),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Adicionar  objetos',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF17191A),
                                                      ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    scaneado =
                                                        await FlutterBarcodeScanner
                                                            .scanBarcode(
                                                      '#C62828', // scanning line color
                                                      'Cancelar', // cancel button text
                                                      true, // whether to show the flash icon
                                                      ScanMode.QR,
                                                    );

                                                    if (scaneado != '-1') {
                                                      setState(() => FFAppState()
                                                              .totalcoletado =
                                                          FFAppState()
                                                                  .totalcoletado +
                                                              1);
                                                      setState(() =>
                                                          FFAppState()
                                                              .scaneado
                                                              .add(scaneado!));
                                                      soundPlayer ??=
                                                          AudioPlayer();
                                                      if (soundPlayer!
                                                          .playing) {
                                                        await soundPlayer!
                                                            .stop();
                                                      }

                                                      soundPlayer!
                                                          .setAsset(
                                                              'assets/audios/beep-06.mp3')
                                                          .then((_) =>
                                                              soundPlayer!
                                                                  .play());
                                                    }

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    constraints: BoxConstraints(
                                                      maxHeight: 50,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFE9E9E9),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 3, 0),
                                                          child: Icon(
                                                            Icons.qr_code,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(3,
                                                                      0, 0, 0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .barcode,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Controle avulso:  ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF17191A),
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: avulsoController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF354088),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF354088),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    filled: true,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF17191A),
                                                      ),
                                                  keyboardType:
                                                      const TextInputType
                                                              .numberWithOptions(
                                                          signed: true,
                                                          decimal: true),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() => FFAppState()
                                                            .totalcoletado =
                                                        FFAppState()
                                                                .totalcoletado +
                                                            int.parse(
                                                                avulsoController!
                                                                    .text));
                                                    setState(() {
                                                      avulsoController?.clear();
                                                      reversoController
                                                          ?.clear();
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add_circle_outline,
                                                    color: Color(0xFF2F3437),
                                                    size: 32,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Controle reverso:  ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF17191A),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        reversoController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF354088),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF354088),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      filled: true,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF17191A),
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      setState(() => FFAppState()
                                                              .totalcoletado =
                                                          FFAppState()
                                                                  .totalcoletado +
                                                              int.parse(
                                                                  reversoController!
                                                                      .text));
                                                      setState(() {
                                                        avulsoController
                                                            ?.clear();
                                                        reversoController
                                                            ?.clear();
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.add_circle_outline,
                                                      color: Color(0xFF2F3437),
                                                      size: 32,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 50, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      final coletasUpdateData =
                                                          {
                                                        ...createColetasRecordData(
                                                          totalcoletado:
                                                              FFAppState()
                                                                  .totalcoletado,
                                                        ),
                                                        'objetosbipados':
                                                            FFAppState()
                                                                .scaneado,
                                                      };
                                                      await detalheColetaColetasRecord
                                                          .reference
                                                          .update(
                                                              coletasUpdateData);
                                                      setState(() => FFAppState()
                                                          .totalcoletado = 0);
                                                      setState(() =>
                                                          FFAppState()
                                                              .scaneado = []);
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Coleta '),
                                                            content: Text(
                                                                'Coleta finalizada com sucesso!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'fechar'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );

                                                      context
                                                          .pushNamed('inicial');
                                                    },
                                                    text: 'Finalizar coleta',
                                                    options: FFButtonOptions(
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 0),
                                      child: Builder(
                                        builder: (context) {
                                          final coletados =
                                              FFAppState().scaneado.toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: coletados.length,
                                            itemBuilder:
                                                (context, coletadosIndex) {
                                              final coletadosItem =
                                                  coletados[coletadosIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: Color(0xFFF1F4F8),
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 8, 8, 8),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF1F4F8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .truck,
                                                            color: Color(
                                                                0xFF959D9E),
                                                            size: 24,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  coletadosItem,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
