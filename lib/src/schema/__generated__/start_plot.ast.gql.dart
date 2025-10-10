// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const StartPlot = _i1.OperationDefinitionNode(
  type: _i1.OperationType.subscription,
  name: _i1.NameNode(value: 'StartPlot'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'drfList')),
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'xMin')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'xMax')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'windowSize')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'updateDelay')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'nAcquisitions')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'triggerEvent')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'startTime')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'endTime')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(
    selections: [
      _i1.FieldNode(
        name: _i1.NameNode(value: 'startPlot'),
        alias: null,
        arguments: [
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'drfList'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'drfList')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'xMin'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'xMin')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'xMax'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'xMax')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'windowSize'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'windowSize')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'updateDelay'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'updateDelay')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'nAcquisitions'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'nAcquisitions')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'triggerEvent'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'triggerEvent')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'startTime'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'startTime')),
          ),
          _i1.ArgumentNode(
            name: _i1.NameNode(value: 'endTime'),
            value: _i1.VariableNode(name: _i1.NameNode(value: 'endTime')),
          ),
        ],
        directives: [],
        selectionSet: _i1.SelectionSetNode(
          selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'plotId'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'timestamp'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'triggerTimestamp'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'data'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(
                selections: [
                  _i1.FieldNode(
                    name: _i1.NameNode(value: 'channelRate'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  _i1.FieldNode(
                    name: _i1.NameNode(value: 'channelUnits'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  _i1.FieldNode(
                    name: _i1.NameNode(value: 'channelStatus'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  _i1.FieldNode(
                    name: _i1.NameNode(value: 'channelData'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: _i1.SelectionSetNode(
                      selections: [
                        _i1.FieldNode(
                          name: _i1.NameNode(value: 'timestamp'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        _i1.FieldNode(
                          name: _i1.NameNode(value: 'result'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(
                            selections: [
                              _i1.InlineFragmentNode(
                                typeCondition: _i1.TypeConditionNode(
                                  on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'Scalar'),
                                    isNonNull: false,
                                  ),
                                ),
                                directives: [],
                                selectionSet: _i1.SelectionSetNode(
                                  selections: [
                                    _i1.FieldNode(
                                      name: _i1.NameNode(value: 'scalarValue'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                  ],
                                ),
                              ),
                              _i1.InlineFragmentNode(
                                typeCondition: _i1.TypeConditionNode(
                                  on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'ScalarArray'),
                                    isNonNull: false,
                                  ),
                                ),
                                directives: [],
                                selectionSet: _i1.SelectionSetNode(
                                  selections: [
                                    _i1.FieldNode(
                                      name: _i1.NameNode(
                                        value: 'scalarArrayValue',
                                      ),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
const document = _i1.DocumentNode(definitions: [StartPlot]);
