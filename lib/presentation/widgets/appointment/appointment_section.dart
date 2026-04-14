import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';

// ─────────────────────────────────────────────────────────────
//  📧 EmailJS CONFIG
//  1. Sign up FREE at https://emailjs.com
//  2. Add Email Service (Gmail) → copy Service ID
//  3. Create Email Template with these variables:
//       {{from_name}}  {{mobile}}  {{date}}  {{medical_issue}}
//     Set "To Email" to: riyadradoan@gmail.com
//  4. Go to Account → Public Key → copy it
//  5. Paste your 3 values below
// ─────────────────────────────────────────────────────────────
class _EmailConfig {
  static const String serviceId  = 'service_fmx3p5c';    // e.g. service_ab12cd
  static const String templateId = 'template_kfsibwu';   // e.g. template_xy78zw
  static const String publicKey  = 'AR9R07d7NpsvcCqPb';    // e.g. user_aBcDeFgHiJ
  static const String toEmail    = 'riyadradoan@gmail.com';
}

enum _FormStatus { idle, loading, success, error }

class AppointmentSection extends StatefulWidget {
  const AppointmentSection({super.key});

  @override
  State<AppointmentSection> createState() => _AppointmentSectionState();
}

class _AppointmentSectionState extends State<AppointmentSection> {
  final _formKey    = GlobalKey<FormState>();
  final _nameCtrl   = TextEditingController();
  final _mobileCtrl = TextEditingController();
  final _dateCtrl   = TextEditingController();
  final _issueCtrl  = TextEditingController();

  _FormStatus _status   = _FormStatus.idle;
  String      _errorMsg = '';

  @override
  void dispose() {
    _nameCtrl.dispose();
    _mobileCtrl.dispose();
    _dateCtrl.dispose();
    _issueCtrl.dispose();
    super.dispose();
  }

  // ── Email via EmailJS REST API ────────────────────────────
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _status = _FormStatus.loading; _errorMsg = ''; });

    try {
      final res = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'Content-Type': 'application/json',
          'origin': 'http://localhost',
        },
        body: jsonEncode({
          'service_id':  _EmailConfig.serviceId,
          'template_id': _EmailConfig.templateId,
          'user_id':     _EmailConfig.publicKey,
          'template_params': {
            'to_email':      _EmailConfig.toEmail,
            'name':     _nameCtrl.text.trim(),
            'mobile':        _mobileCtrl.text.trim(),
            'date':          _dateCtrl.text.trim(),
            'issue': _issueCtrl.text.trim(),
            'reply_to':      _EmailConfig.toEmail,
          },
        }),
      );

      if (res.statusCode == 200) {
        _nameCtrl.clear();
        _mobileCtrl.clear();
        _dateCtrl.clear();
        _issueCtrl.clear();
        setState(() => _status = _FormStatus.success);
      } else {
        setState(() {
          _status   = _FormStatus.error;
          _errorMsg = 'Could not send (code ${res.statusCode}). Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _status   = _FormStatus.error;
        _errorMsg = 'Network error. Please check your connection and try again.';
      });
    }
  }

  void _reset() => setState(() { _status = _FormStatus.idle; _errorMsg = ''; });

  // ── LAYOUT ────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final w       = MediaQuery.of(context).size.width;
    final isMobile = w < 900;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 70),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primary.withOpacity(0.05), AppTheme.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _InfoColumn(),
              const SizedBox(height: 40),
              _FormCard(
                formKey:    _formKey,
                nameCtrl:   _nameCtrl,
                mobileCtrl: _mobileCtrl,
                dateCtrl:   _dateCtrl,
                issueCtrl:  _issueCtrl,
                status:     _status,
                errorMsg:   _errorMsg,
                onSubmit:   _submit,
                onReset:    _reset,
                context:    context,
              ),
            ])
          : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: _InfoColumn()),
              const SizedBox(width: 60),
              Expanded(
                child: _FormCard(
                  formKey:    _formKey,
                  nameCtrl:   _nameCtrl,
                  mobileCtrl: _mobileCtrl,
                  dateCtrl:   _dateCtrl,
                  issueCtrl:  _issueCtrl,
                  status:     _status,
                  errorMsg:   _errorMsg,
                  onSubmit:   _submit,
                  onReset:    _reset,
                  context:    context,
                ),
              ),
            ]),
    );
  }
}

// ─── Left info column ─────────────────────────────────────
class _InfoColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('Appointment',
              style: AppTheme.buttonText.copyWith(fontSize: 12)),
        ),
        const SizedBox(height: 20),
        Text(AppContent.appointmentTitle, style: AppTheme.heading2),
        const SizedBox(height: 16),
        Text(AppContent.appointmentSubtitle,
            style: AppTheme.heading3.copyWith(color: AppTheme.primary)),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppContent.appointmentCallText,
                  style: GoogleFonts.lato(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 6),
              Row(children: [
                const Icon(Icons.phone, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(AppContent.appointmentPhone,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    )),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Form card (white box) ────────────────────────────────
class _FormCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl, mobileCtrl, dateCtrl, issueCtrl;
  final _FormStatus status;
  final String errorMsg;
  final VoidCallback onSubmit, onReset;
  final BuildContext context;

  const _FormCard({
    required this.formKey,
    required this.nameCtrl,
    required this.mobileCtrl,
    required this.dateCtrl,
    required this.issueCtrl,
    required this.status,
    required this.errorMsg,
    required this.onSubmit,
    required this.onReset,
    required this.context,
  });

  @override
  Widget build(BuildContext ctx) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: status == _FormStatus.success
          ? _SuccessMessage(onReset: onReset)
          : _FormBody(
              formKey:    formKey,
              nameCtrl:   nameCtrl,
              mobileCtrl: mobileCtrl,
              dateCtrl:   dateCtrl,
              issueCtrl:  issueCtrl,
              status:     status,
              errorMsg:   errorMsg,
              onSubmit:   onSubmit,
              parentContext: context,
            ),
    );
  }
}

// ─── Success message widget ───────────────────────────────
class _SuccessMessage extends StatelessWidget {
  final VoidCallback onReset;
  const _SuccessMessage({required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            color: AppTheme.accent,
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryLight, width: 2),
          ),
          child: Icon(Icons.check_circle_rounded,
              color: AppTheme.primary, size: 52),
        ),
        const SizedBox(height: 28),
        Text(
          'Your submission was successful!',
          style: AppTheme.heading3.copyWith(
              color: AppTheme.primary, fontSize: 21),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14),
        Text(
          'Thank you for reaching out to us.\n'
          'We have received your appointment request and our team will '
          'contact you shortly at the number you provided.',
          style: AppTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'A notification has been sent to our team.',
          style: AppTheme.bodySmall.copyWith(
              color: AppTheme.primary, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        OutlinedButton.icon(
          onPressed: onReset,
          icon: const Icon(Icons.add_circle_outline, size: 18),
          label: const Text('Book Another Appointment'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.primary,
            side: BorderSide(color: AppTheme.primary, width: 1.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
            padding:
                const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

// ─── Form body ────────────────────────────────────────────
class _FormBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl, mobileCtrl, dateCtrl, issueCtrl;
  final _FormStatus status;
  final String errorMsg;
  final VoidCallback onSubmit;
  final BuildContext parentContext;

  const _FormBody({
    required this.formKey,
    required this.nameCtrl,
    required this.mobileCtrl,
    required this.dateCtrl,
    required this.issueCtrl,
    required this.status,
    required this.errorMsg,
    required this.onSubmit,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = status == _FormStatus.loading;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Book Appointment',
              style: AppTheme.heading3.copyWith(fontSize: 20)),
          const SizedBox(height: 4),
          Text('Fill in the form and we\'ll get back to you.',
              style: AppTheme.bodySmall),
          const SizedBox(height: 24),

          // Name
          _AppField(
            controller: nameCtrl,
            label: 'Full Name',
            hint: 'Enter your full name',
            icon: Icons.person_outline,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Name is required' : null,
          ),
          const SizedBox(height: 16),

          // Mobile
          _AppField(
            controller: mobileCtrl,
            label: 'Mobile Number',
            hint: 'e.g. 01XXXXXXXXX',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Mobile is required' : null,
          ),
          const SizedBox(height: 16),

          // Date picker
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(
                context: parentContext,
                initialDate: DateTime.now().add(const Duration(days: 1)),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                builder: (c, child) => Theme(
                  data: Theme.of(c).copyWith(
                      colorScheme:
                          ColorScheme.light(primary: AppTheme.primary)),
                  child: child!,
                ),
              );
              if (picked != null) {
                dateCtrl.text =
                    '${picked.day}/${picked.month}/${picked.year}';
              }
            },
            child: AbsorbPointer(
              child: _AppField(
                controller: dateCtrl,
                label: 'Appointment Date',
                hint: 'Tap to select date',
                icon: Icons.calendar_today_outlined,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Date is required' : null,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Medical issue
          _AppField(
            controller: issueCtrl,
            label: 'Medical Issue',
            hint: 'Describe your medical issue...',
            icon: Icons.medical_information_outlined,
            maxLines: 3,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? 'Please describe your issue'
                : null,
          ),

          // Error banner
          if (status == _FormStatus.error) ...[
            const SizedBox(height: 14),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(children: [
                Icon(Icons.error_outline,
                    color: Colors.red.shade600, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(errorMsg,
                      style: TextStyle(
                          color: Colors.red.shade700, fontSize: 13)),
                ),
              ]),
            ),
          ],

          const SizedBox(height: 24),

          // Submit button
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: isLoading ? null : onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor:
                    AppTheme.primary.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                elevation: 0,
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.5))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send_rounded, size: 18),
                        const SizedBox(width: 8),
                        Text('Send Request', style: AppTheme.buttonText),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Reusable text field ──────────────────────────────────
class _AppField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final IconData icon;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _AppField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: AppTheme.primary, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppTheme.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppTheme.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppTheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        labelStyle: AppTheme.bodySmall,
        hintStyle: AppTheme.bodySmall,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}