import 'package:dev_x_hub/apps/data/local/hiveSource/hive_files.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'hive_files_impl.dart';

final filesProvider = Provider<HiveFiles>((ref) => HiveFileImpl());