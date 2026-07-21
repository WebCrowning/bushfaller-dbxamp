export type CurrencyCode = "XAF" | "USD";

export type Product = {
  id: number;
  name: string;
  price: number;
  transportFee: number;
  image: string;
  imageZoom?: number;
  description: string;
  featured: number;
  category: string;
  packageName: "pack" | "bag" | "bundle" | "carton";
  unitType: "pcs" | "kg";
  unitValue: number;
  stockPackages: number;
};

export type CartItem = {
  productId: number;
  name: string;
  price: number;
  transportFee: number;
  image: string;
  quantityPackages: number;
  packageName: "pack" | "bag" | "bundle" | "carton";
  unitType: "pcs" | "kg";
  unitValue: number;
};

export type OrderStatus = "Pending" | "Paid" | "Shipped" | "Delivered";

export type Order = {
  id: number;
  public_order_id: string;
  user_id: number;
  total_price: number;
  status: OrderStatus;
  address: string;
  phone: string;
  country: string;
  customer_name: string;
  customer_email: string;
  payment_id: string | null;
  received_confirmed_at: string | null;
  created_at: string;
};

export type OrderItem = {
  id: number;
  order_id: number;
  product_id: number;
  quantity_packages: number;
  unit_type: "pcs" | "kg";
  unit_value: number;
  package_name?: string;
  price: number;
  transport_fee?: number;
  name: string;
  image: string;
};

export type ContactMessage = {
  id: number;
  user_id: number | null;
  customer_email: string;
  message: string;
  reply: string | null;
  status: "Open" | "Replied";
  created_at: string;
};
