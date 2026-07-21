import { SiteHeader } from "@/components/site-header";
import { SiteFooter } from "@/components/site-footer";

export default function SupportPage() {
  return (
    <div className="min-h-screen">
      <SiteHeader />
      <main className="container-shell py-10">
        <div className="max-w-3xl mx-auto">
          <div className="mb-8">
            <p className="text-blue-600 font-semibold">Support Center</p>
            <h1 className="text-4xl font-bold text-gray-900 mt-2">How Can We Help?</h1>
            <p className="text-gray-600 mt-2">
              Find answers to your questions or get in touch with our support team.
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-6 mb-10">
            <div className="bg-white rounded-lg shadow-md p-6">
              <h3 className="text-xl font-bold text-gray-800 mb-3">📞 Call Us</h3>
              <p className="text-gray-600 mb-3">
                Speak directly with our support team. We&apos;re available during business hours.
              </p>
              <div className="space-y-2">
                <p className="text-gray-700">
                  <span className="font-semibold">Phone 1:</span> +1-234-567-8900
                </p>
                <p className="text-gray-700">
                  <span className="font-semibold">Phone 2:</span> +1-234-567-8901
                </p>
              </div>
            </div>

            <div className="bg-white rounded-lg shadow-md p-6">
              <h3 className="text-xl font-bold text-gray-800 mb-3">✉️ Email Us</h3>
              <p className="text-gray-600 mb-3">
                Send us an email and we&apos;ll respond within 24 hours.
              </p>
              <p className="text-gray-700">
                <a href="mailto:support@bushfaller.com" className="text-blue-600 hover:text-blue-800 font-semibold">
                  support@bushfaller.com
                </a>
              </p>
            </div>

            <div className="bg-white rounded-lg shadow-md p-6">
              <h3 className="text-xl font-bold text-gray-800 mb-3">💬 Chat with Admin</h3>
              <p className="text-gray-600 mb-3">
                Use the contact form to send a message directly to our admin team.
              </p>
              <a
                href="/contact"
                className="inline-block mt-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                Open Chat Form
              </a>
            </div>

            <div className="bg-white rounded-lg shadow-md p-6">
              <h3 className="text-xl font-bold text-gray-800 mb-3">❓ FAQ</h3>
              <p className="text-gray-600 mb-3">
                Check our frequently asked questions for quick answers.
              </p>
              <a
                href="/admin/faq"
                className="inline-block mt-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
              >
                View FAQ
              </a>
            </div>
          </div>

          <div className="bg-blue-50 rounded-lg p-6 border border-blue-200">
            <h2 className="text-2xl font-bold text-gray-800 mb-4">Common Questions</h2>
            
            <div className="space-y-6">
              <div>
                <h3 className="text-lg font-semibold text-gray-800 mb-2">What are your business hours?</h3>
                <p className="text-gray-600">
                  We operate Monday to Friday, 9:00 AM - 5:00 PM. Our support team responds to emails and messages even outside business hours.
                </p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-800 mb-2">How long does delivery take?</h3>
                <p className="text-gray-600">
                  Delivery depends on your location. For local deliveries, we typically deliver within 2-3 business days. International shipping may take 5-10 business days. You can track your order status in &quot;My Orders&quot;.
                </p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-800 mb-2">What is your return policy?</h3>
                <p className="text-gray-600">
                  We want you to be satisfied with your purchase. If you receive a damaged or incorrect item, please contact us within 48 hours with photos. We&apos;ll arrange a replacement or refund.
                </p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-800 mb-2">Do you offer wholesale pricing?</h3>
                <p className="text-gray-600">
                  Yes! Contact our support team to inquire about wholesale orders and bulk pricing for businesses and restaurants.
                </p>
              </div>

              <div>
                <h3 className="text-lg font-semibold text-gray-800 mb-2">What payment methods do you accept?</h3>
                <p className="text-gray-600">
                  We accept PayPal, credit cards, and debit cards. All payments are secure and encrypted.
                </p>
              </div>
            </div>
          </div>
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
